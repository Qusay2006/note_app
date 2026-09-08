import 'dart:io';
import 'dart:ui';

import 'package:fpdart/src/either.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/core/usecases/use_cases.dart';
import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';
import 'package:rivaan_project2/features/blog/domain/repo/blog_repo.dart';

class AddedBlogUseCase implements UseCases<BlogEntity , AddedBlogParms>{
  final BlogRepo _repo;
  AddedBlogUseCase({required this._repo});

  @override
  Future<Either<Failures, BlogEntity>> call(AddedBlogParms params) async{
  return await _repo.addBlog(params.blog, params.image);
  }
}

class AddedBlogParms {
  final BlogEntity blog;
  final File image;

  AddedBlogParms({required this.blog, required this.image});
}