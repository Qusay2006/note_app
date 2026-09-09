import 'package:flutter/material.dart';
import 'package:rivaan_project2/core/utild/calculate_reading_time.dart';
import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';
import 'package:rivaan_project2/features/blog/presintation/page/blog_details_page.dart';

class BlogCard extends StatelessWidget {
  final BlogEntity blogEntity;
  final Color color;

  const BlogCard({super.key, required this.blogEntity, required this.color,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () =>
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => BlogDetailsPage(blog: blogEntity,),)),
      child: Container(height: 200,
          margin: const EdgeInsets.all(14),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(14)
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: blogEntity.topics.map((e) =>
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Chip(label: Text(e)),
                      ),).toList(),
                ),
              ),
              Text(blogEntity.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),
              SizedBox(height: 50,),
              Text('${calculateReadingTime(blogEntity.content)} min')],

          )),
    );
  }
}
