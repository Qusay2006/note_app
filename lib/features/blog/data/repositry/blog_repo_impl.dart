import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:rivaan_project2/core/error/app_exeption.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/core/network/connection_checker.dart';
import 'package:rivaan_project2/features/blog/data/datasource/remoteData/blog_remote_data.dart';
import 'package:rivaan_project2/features/blog/data/datasource/locaData/blog_local_data_source.dart';
import 'package:rivaan_project2/features/blog/data/model/blog_model.dart';
import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';
import 'package:rivaan_project2/features/blog/domain/repo/blog_repo.dart';

class BlogRepoImpl implements BlogRepo {
  final BlogRemoteData _remoteData;
  final ConnectionChecker _connectionChecker;
  final BlogLocalDataSource _localData;
  BlogRepoImpl({required this._remoteData, required this._connectionChecker, required this._localData});

  @override
  Future<Either<Failures, BlogEntity>> addBlog(BlogEntity blog, File imageUrl) async {
    try {
      if(!await _connectionChecker.isConnected)
        {
          return Left(Failures("No Internet Connection"));
        }
      final blogmodel = BlogModel(id: blog.id,
          posterId: blog.posterId,
          title: blog.title,
          content: blog.content,
          imageUrl: '',
          topics: blog.topics,
          updatedAt: DateTime.now());
      final image = await _remoteData.uploadImage(blogmodel, imageUrl);
     final updatedBlogModel = blogmodel.copyWith(imageUrl: image);
      final addedBlog = await _remoteData.addBlogs(updatedBlogModel);
      return Right(addedBlog.toEntity());
    } on AppException catch (e) {
      return Left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, List<BlogEntity>>> getBlog()async {
      try{
        if(await _connectionChecker.isConnected) {
          final blogmodel = await _remoteData.getBlogs();
          final blog = blogmodel.map((e) => e.toEntity(),).toList();
          _localData.addLocalBlog(blogs: blogmodel);
          return Right(blog);
        }
        else
           {
             final dd = _localData.loadBlogs().map((e) =>e.toEntity()).toList();
             return Right(dd);
           }

      }on AppException
      catch (e){
        return Left(Failures(e.message));
      }
  }
}