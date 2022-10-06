import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_index_state.dart';

class ChangeIndexCubit extends Cubit<ChangeIndexState> {
  ChangeIndexCubit()
      : super(ChangeIndexState(
            currentIndexTagsBottom: 0, currentIndexTagsTop: 0));
  static ChangeIndexCubit get(context) => BlocProvider.of(context);

  void changeIndexTop(index) {
    state.currentIndexTagsTop = index;
    emit(ChangeIndexState(currentIndexTagsTop: state.currentIndexTagsTop));
  }

  void changeIndexBottom(index) {
    state.currentIndexTagsBottom = index;
    emit(
        ChangeIndexState(currentIndexTagsBottom: state.currentIndexTagsBottom));
  }
}
