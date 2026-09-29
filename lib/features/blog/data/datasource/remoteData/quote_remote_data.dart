import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rivaan_project2/features/blog/data/datasource/remoteData/quote_api_service.dart';
import 'package:rivaan_project2/features/blog/data/model/quote_model.dart';


abstract interface class QuoteRemoteData {
  Future<QuoteModel>getQuote();
}

@LazySingleton(as: QuoteRemoteData)
class QuoteRemoteDataImplement implements QuoteRemoteData {
  final QuoteApiService _apiService;
  QuoteRemoteDataImplement(this._apiService);

  @override
  Future<QuoteModel> getQuote()async {
    try{
   return await _apiService.getQuote();
    }on DioException catch (e){
      throw Exception(e.message);
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}