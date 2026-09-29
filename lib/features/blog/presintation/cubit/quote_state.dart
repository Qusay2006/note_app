import 'package:flutter/foundation.dart';
import '../../domain/entity/quote_entity.dart';

@immutable
sealed class QuoteState {}

final class QuoteInitial extends QuoteState {}

final class QuoteLoading extends QuoteState {}

final class QuoteSuccess extends QuoteState {
  final QuoteEntity quote;

  QuoteSuccess({required this.quote});
}

final class QuoteFailure extends QuoteState {
  final String message;

  QuoteFailure({required this.message});
}