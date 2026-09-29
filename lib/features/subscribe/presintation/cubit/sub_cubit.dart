import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/features/subscribe/presintation/cubit/sub_state.dart';

import '../../data/repo/sub_repo.dart';

class SubscribeCubit extends Cubit<SubscribeState>{
  final SubRepo _repo;
  SubscribeCubit(SubRepo repo) : _repo = repo, super(SubscribeState.initial());

  Future<void>toggleChange()async {
    final oldState = state.isSubscribed;
    emit(state.copyWith(isSubscribed: !oldState,error: null));

    try{
      await _repo.subscribe();
    }catch (e){
      emit(state.copyWith(isSubscribed: oldState,error: e.toString()));
    }
  }
}