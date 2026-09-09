import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/core/bloc/bloc_state.dart';
import 'package:rivaan_project2/core/theme/app_pallete.dart';
import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';
import 'package:rivaan_project2/features/blog/presintation/bloc/blog_bloc.dart';
import 'package:rivaan_project2/features/blog/presintation/bloc/blog_event.dart';
import 'package:rivaan_project2/features/blog/presintation/page/add_new_blog_page.dart';
import 'package:rivaan_project2/features/blog/presintation/widget/blog_card.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {

  @override
  void initState() {
    context.read<BlogBloc>().add(getBlogEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Blog App"),
      actions: [
        IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddNewBlogPage();
          },));
        }, icon: Icon(Icons.add_circle))
      ],),
      body: BlocConsumer<BlogBloc, BlocState<BlogEntity>>(
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(error.toString())));
            },
          );
        },
        builder: (context, state) {
          return state.when(initial: () {
            return SizedBox();
          },
              loading: () {
            return Center(child: CircularProgressIndicator(),);
              }, success: (data) {
                return SizedBox();
              }, successDisplay: (data) {
                return ListView.builder(
                  itemCount:data.length,
                  itemBuilder: (context, index) {
                    final blog = data[index];
                    return BlogCard(blogEntity: blog,
                        color: index%3==0 ?AppPallete.gradient1:
                               index%3==1 ?AppPallete.gradient2:
                                         AppPallete.gradient3);
                  },);
              }, error: (error) {
                return Center(child: Text(error.toString()),);
              },);

        },
      ),);
  }
}
