import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/core/bloc/bloc_state.dart';
import 'package:rivaan_project2/core/common/cubit/app_user_cubit.dart';
import 'package:rivaan_project2/core/common/entity/user_entity.dart';
import 'package:rivaan_project2/features/auth/domain/usecases/auth_current_user_use_case.dart';
import 'package:rivaan_project2/features/auth/domain/usecases/auth_login_use_case.dart';
import 'package:rivaan_project2/features/auth/domain/usecases/auth_signUp_use_cases.dart';
import 'package:rivaan_project2/features/auth/presintation/bloc/auth_event.dart';

class AuthBloc extends Bloc<AuthEvent,BlocState<UserEntity>> {
  final AuthSignupUseCases _signupUseCases;
  final AuthLoginUseCase _loginUseCase;
  final AuthCurrentUserUseCase _currentUserUseCase;
  final AppUserCubit _userCubit;

  AuthBloc({required AuthSignupUseCases signInUserCase,
    required AuthLoginUseCase loginUseCase,
    required AuthCurrentUserUseCase currentUseCase,
  required AppUserCubit userCubit}) :
        _signupUseCases = signInUserCase,
        _loginUseCase = loginUseCase,
        _currentUserUseCase = currentUseCase,
        _userCubit =userCubit,
        super(BlocState.initial()) {

    void isLogedIn(
        UserEntity user,
        Emitter<BlocState<UserEntity>> emit
        ) {
      _userCubit.updatedUser(user);
      emit(BlocState.success(user));
    }

  on <AuthSingUpEvent>((event, emit)async {
    emit(BlocState.loading());
     final result =  await _signupUseCases.call(UserSignUpPrams(name: event.name, email: event.email, password:event.password));
      result.fold((l) => emit(BlocState.error(l.message)),
            (user) => isLogedIn(user,emit),);
  },);

  on<AuthLogInEvent>((event, emit) async{
    emit(BlocState.loading());

    final result =await _loginUseCase.call(UserLogInPrams(email: event.email, password:event.password));
    return result.fold((l) {
      emit(BlocState.error(l.message));
    }, (user) => isLogedIn(user, emit),);
  },);

  on <AuthCurrentUserEvent>((event, emit)async {
    emit(BlocState.loading());
    final resutl =await _currentUserUseCase.call(EmptyPrams());
    resutl.fold((l) => emit(BlocState.error(l.message)),
          (currentUser) =>isLogedIn(currentUser , emit),);
  },);



}
}