import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/dio_config.dart';
import '../../../model/soccer_model.dart';
import '../../const/colors.dart';
part 'soccer_state.dart';

class SoccerCubit extends Cubit<SoccerState> {
  SoccerCubit() : super(SoccerInitial());
  DioConfig? dioConfig;

  List<Soccer> newsArList = [];
  List<Soccer> newsEnList = [];
  bool isLoadingTop = false;
  bool isLoadingBottom = false;


  String enUrl =
      'language=en&country=us&category=sports&${MyConst.apiKey}';
  String arUrl =
      'language=ar&country=eg&category=sports&${MyConst.apiKey}';
  static SoccerCubit get(context) => BlocProvider.of(context);

  void getSoccerEnData() async {
    isLoadingTop = true;
    var res = await DioConfig.dioConfig(enUrl);

    if (res.statusCode == 200) {
      var jsonString = res.data;

      for (var e in (jsonString['articles'] as List)) {
        newsEnList.add(Soccer.fromJson(e));
      }
      isLoadingTop = false;

      return emit(SoccerEN());
    }
  }

  void getSoccerArData() async {
    isLoadingBottom = true;
    var res = await DioConfig.dioConfig(arUrl);

    if (res.statusCode == 200) {
      var jsonString = res.data;

      for (var e in (jsonString['articles'] as List)) {
        newsArList.add(Soccer.fromJson(e));
      }
      isLoadingBottom = false;
      return emit(SoccerAR());
    }
  }
}
