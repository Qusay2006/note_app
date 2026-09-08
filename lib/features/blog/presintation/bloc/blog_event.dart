import 'dart:io';

import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';

abstract interface class BlogEvent {

}

class addedBlogEvent extends BlogEvent{
final File image;
final BlogEntity blog;

  addedBlogEvent({required this.image, required this.blog});
}

class getBlogEvent extends BlogEvent {

}
