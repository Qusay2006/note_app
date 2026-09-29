import 'package:fpdart/fpdart.dart';

import '../../../../core/error/app_faliure.dart';
import '../entity/quote_entity.dart';

abstract interface class QuoteRepository {
  Future<Either<Failures, QuoteEntity>> getQuote();
}