import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/core/usecases/use_cases.dart';
import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';
import 'package:rivaan_project2/features/blog/domain/repo/blog_repo.dart';

@lazySingleton
class GetBlogUseCase implements UseCases<List<BlogEntity>,getParams>{
  final BlogRepo _repo;
  GetBlogUseCase({required this._repo});

  @override
  Future<Either<Failures, List<BlogEntity>>> call(getParams params) async{
   return await _repo.getBlog();
  }
}

class getParams {
}