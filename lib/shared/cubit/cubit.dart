import '../../modules/messenger_screesn.dart';
import 'package:amiraapp/shared/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<Appstates> {
  AppCubit() : super(initialStates());

  static AppCubit get(context) =>
      BlocProvider.of(context); // object class cubit
  BuildContext context;

  void change(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Messenger_screen()));
    emit(navigateToScreen());
  }
}
