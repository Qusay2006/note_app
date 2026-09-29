import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/quote_use_case.dart';
import 'quote_state.dart';

@injectable
class QuoteCubit extends Cubit<QuoteState> {
  final GetQuoteUseCase _getQuoteUseCase;

  QuoteCubit({required GetQuoteUseCase getQuoteUseCase})
      : _getQuoteUseCase = getQuoteUseCase,
        super(QuoteInitial());

  Future<void> fetchQuote() async {
    emit(QuoteLoading());

    final result = await _getQuoteUseCase(NoParams());

    result.fold(
          (failure) => emit(QuoteFailure(message: failure.message)),
          (quote) => emit(QuoteSuccess(quote: quote)),
    );
  }
}