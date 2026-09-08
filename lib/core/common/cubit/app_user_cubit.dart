import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/core/common/entity/user_entity.dart';

import 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(const AppUserState.initial());

  void updatedUser(UserEntity? user) {
    if (user == null) {
      emit(AppUserState.initial());
    }
    else {
      emit(AppUserState.loggedIn(user));
    }
  }
}
