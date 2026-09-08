import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';

abstract interface class BlogRepo {

  Future<Either<Failures,BlogEntity>> addBlog(BlogEntity blog, File imageUrl);
  Future<Either<Failures,List<BlogEntity>>> getBlog();
}