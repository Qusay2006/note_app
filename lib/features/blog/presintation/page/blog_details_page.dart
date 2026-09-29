import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/core/utild/calculate_reading_time.dart';
import 'package:rivaan_project2/core/utild/format_date.dart';
import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/theme/app_pallete.dart';
import '../bloc/blog_bloc.dart';


class BlogDetailsProvider extends StatelessWidget {
  final BlogEntity blog;
  const BlogDetailsProvider(this.blog, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<BlogBloc>(),
      child: BlogDetailsPage(blog: blog),);
  }
}



class BlogDetailsPage extends StatelessWidget {
  final BlogEntity blog ;
  const BlogDetailsPage({super.key, required this.blog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: Scrollbar(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start
            ,children: [
            Text(blog.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            const SizedBox(height: 20,),
            Text('By ${blog.posterName}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
            const SizedBox(height: 5,),
            Text('${formatDateBydMMYYYY(blog.updatedAt)},${calculateReadingTime(blog.content)}'
            ,style: const TextStyle(fontSize: 16,color: AppPallete.greyColor,fontWeight: FontWeight.w300),),
            const SizedBox(height: 20,),
            ClipRRect(borderRadius: BorderRadius.circular(20),
            child: Image.network(blog.imageUrl),),
            const SizedBox(height: 20,),
            Text(blog.content
              ,style: const TextStyle(fontSize: 16,color: AppPallete.greyColor,fontWeight: FontWeight.w300,height: 1.7),),




          ],),
        ),
      ),
    ),);
  }
}
