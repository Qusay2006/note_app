import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/core/usecases/use_cases.dart';
import 'package:rivaan_project2/features/blog/domain/entity/quote_entity.dart';
import 'package:rivaan_project2/features/blog/domain/repo/quote_repo.dart';

@lazySingleton
class GetQuoteUseCase implements UseCases<QuoteEntity, NoParams> {
  final QuoteRepository _repo;

  GetQuoteUseCase({required QuoteRepository repo}) : _repo = repo;

  @override
  Future<Either<Failures, QuoteEntity>> call(NoParams params) async {
    return await _repo.getQuote();
  }
}

class NoParams {}