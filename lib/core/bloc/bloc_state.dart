import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_state.freezed.dart';

@freezed
abstract class BlocState<T> with _$BlocState<T> {
  const factory BlocState.initial() = _Initial;
  const factory BlocState.loading() = _Loading;
  const factory BlocState.success(T data) = _Success;
  const factory BlocState.successDisplay(List<T> data) = _SuccessDisplay;
  const factory BlocState.error(String error) = _Error;
}