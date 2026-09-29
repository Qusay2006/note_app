import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import '../../domain/entity/quote_entity.dart';
import '../../domain/repo/quote_repo.dart';
import '../datasource/remoteData/quote_remote_data.dart';
















@LazySingleton(as : QuoteRepository)
class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteData remoteData;

  QuoteRepositoryImpl({required this.remoteData});

  Future<Either<Failures, QuoteEntity>> getQuote() async {
    try {
      final quoteModel = await remoteData.getQuote();
      return Right(quoteModel);
    } catch (e) {
      return Left(Failures(e.toString()));
    }
  }
}