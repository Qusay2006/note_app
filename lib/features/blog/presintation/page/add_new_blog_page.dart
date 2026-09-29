import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/core/bloc/bloc_state.dart';
import 'package:rivaan_project2/core/common/cubit/app_user_cubit.dart';
import 'package:rivaan_project2/core/common/cubit/app_user_state.dart';
import 'package:rivaan_project2/core/theme/app_pallete.dart';
import 'package:rivaan_project2/core/utild/pick_image.dart';
import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';
import 'package:rivaan_project2/features/blog/presintation/bloc/blog_bloc.dart';
import 'package:rivaan_project2/features/blog/presintation/bloc/blog_event.dart';
import 'package:rivaan_project2/features/blog/presintation/widget/blog_field.dart';
import '../../../../core/injection/injection.dart';

class AddNewBlogProvider extends StatelessWidget {
  const AddNewBlogProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<BlogBloc>(),
      child: AddNewBlogPage(),);
  }
}




class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  List<String>selectedTopic = [];
  File? image;
  final formKey = GlobalKey<FormState>();


  // هي غلط
  Widget _addedBlogForm(BuildContext context) {
    return Scaffold(appBar: AppBar(actions: [
      IconButton(onPressed: () {
        if (formKey.currentState!.validate() && selectedTopic.isNotEmpty &&
            image != null) {
          final userState = context.read<AppUserCubit>().state;
          context.read<BlogBloc>().add(addedBlogEvent(image: image!,
              blog: BlogEntity(id: '',
                  posterId: userState.whenOrNull(loggedIn: (user) => user.id,) ?? '',
                  title: titleController.text,
                  content: contentController.text,
                  imageUrl: '',
                  topics: selectedTopic,
                  updatedAt: DateTime.now(),
                  posterName: userState.whenOrNull(loggedIn: (user) => user.name)??'')));
        }
      }, icon: Icon(Icons.done_rounded))
    ],),
      body: Form(key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, children: [
              image != null ?
              GestureDetector(onTap: () => selectImage(),
                child: SizedBox(
                  height: 150, width: double.infinity,
                  child: ClipRRect(borderRadius: BorderRadius.circular(10),
                      child: Image.file(image!, fit: BoxFit.cover,)),),
              )
                  :
              GestureDetector(onTap: () {
                selectImage();
              },
                child: DottedBorder(options: OvalDottedBorderOptions(
                    color: AppPallete.borderColor
                    , dashPattern: const [10, 4]),
                    child: Column(children: [
                      Icon(Icons.folder_open, size: 40,),
                      SizedBox(height: 65,),
                      Text("select Image", style: TextStyle(fontSize: 15),),
                    ],)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  'Technology', 'Business', 'Programming', 'Entertainment',
                ].map((e) =>
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(onTap: () {
                        if (selectedTopic.contains(e)) {
                          selectedTopic.remove(e);
                        }
                        else {
                          selectedTopic.add(e);
                        }
                        setState(() {});
                        print(selectedTopic);
                      },
                          child: Chip(color: selectedTopic.contains(e)
                              ? WidgetStatePropertyAll(AppPallete.gradient1)
                              : WidgetStatePropertyAll(AppPallete.borderColor)
                              , label: Text(e))),
                    ),).toList(),
                ),),
              SizedBox(height: 15,),
              BlogField(controller: titleController, hintText: 'Title'),
              BlogField(controller: contentController, hintText: 'Content'),
            ],),
          ),
        ),
      ),);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogBloc, BlocState<BlogEntity>>(
      listener: (context, state) {
        state.whenOrNull(success: (data) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${data.title} is added')));
          Navigator.pop(context);
        },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error.toString())));
          },);
      },
      builder: (context, state) {
        return state.when(
          initial: () {
            return _addedBlogForm(context);
          },
          loading: () {
            return const Center(child: CircularProgressIndicator(),);
          },
          success: (data) {
            return _addedBlogForm(context);
          },
          error: (error) {
            return _addedBlogForm(context);
          },
          successDisplay: (data) {
            return _addedBlogForm(context);
          },);
      },
    );
  }
}