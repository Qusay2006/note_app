import 'dart:nativewrappers/_internal/vm_shared/lib/compact_hash.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivaan_project2/core/bloc/bloc_state.dart';
import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';
import 'package:rivaan_project2/features/blog/domain/usecases/added_blog_use_case.dart';
import 'package:rivaan_project2/features/blog/domain/usecases/get_blog_use_case.dart';

import 'blog_event.dart';


class BlogBloc extends Bloc<BlogEvent, BlocState<BlogEntity>> {
  final AddedBlogUseCase _addedBlogUseCase;
  final GetBlogUseCase _getBlogUseCase;
  BlogBloc({required AddedBlogUseCase addedBlogUserCase,
  required GetBlogUseCase getBlocUseCase})
      : _addedBlogUseCase = addedBlogUserCase,
        _getBlogUseCase = getBlocUseCase,
        super(BlocState.initial()) {

    on<BlogEvent>((event, emit) => emit(BlocState.loading()),);
    
    on<addedBlogEvent>((event, emit) async {
      final result =await _addedBlogUseCase.call(AddedBlogParms(blog:event.blog , image: event.image));
      result.fold((l) => emit(BlocState.error(l.message)), (r) => emit(BlocState.success(r)),);
    });

    on<getBlogEvent>((event, emit) async {
      final result = await _getBlogUseCase.call(getParams());
   result.fold((l) =>emit(BlocState.error(l.message)) , (r) => emit(BlocState.successDisplay(r)));
    },);
  }
}
