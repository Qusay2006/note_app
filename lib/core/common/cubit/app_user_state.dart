import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/user_entity.dart';

part 'app_user_state.freezed.dart';
@freezed
class AppUserState with _$AppUserState {
  const factory AppUserState.initial() = _Initial;
  const factory AppUserState.loggedIn(UserEntity user) = _loggedIN;
}
