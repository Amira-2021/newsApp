import 'package:amiraapp/data_layer/diohelper.dart';
import 'package:amiraapp/presentation/business/business_screen.dart';
import 'package:amiraapp/presentation/sciences/science_screen.dart';
import 'package:amiraapp/presentation/sports/sports_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int click = 0;

  void changeNavItemState(index) {
    click = index;
    emit(ChangeNavState());
  }

  List screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<dynamic> Business = [];

  void getBusiness() {
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "6b8e609aafb14dfca9ef4bd6db74c62f",
    }).then((value) {
      Business = value.data["articles"];
      emit(buisnessState());
    }).catchError((error) {
      emit(buisnessErrorState());
    });
  }

  List<dynamic> Science = [];

  void getScience() {
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "science",
      "apiKey": "6b8e609aafb14dfca9ef4bd6db74c62f",
    }).then((value) {
      Science = value.data["articles"];
      emit(scienceState());
    }).catchError((error) {
      print(error.toString());
      emit(scienceErrorState());
    });
  }

  List<dynamic> Sport = [];

  void getSpoert() {
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "sport",
      "apiKey": "6b8e609aafb14dfca9ef4bd6db74c62f",
    }).then((value) {
      Sport = value.data["articles"];
      emit(sportState());
    }).catchError((error) {
      print(error.toString());
      emit(sportErrorState());
    });
  }
}
