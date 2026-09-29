import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:rivaan_project2/features/blog/data/model/quote_model.dart';

part 'quote_api_service.g.dart';
@RestApi()
abstract interface class QuoteApiService {
  factory QuoteApiService(Dio dio ,{String baseUrl})=_QuoteApiService;

  @GET('/quotes/random')
  Future<QuoteModel>getQuote();
}
