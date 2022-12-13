import 'package:amiraapp/Business_logic/cubit/cubit.dart';
import 'package:amiraapp/Business_logic/cubit/states.dart';
import 'package:amiraapp/shared/styles/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  // String urlImage;
  // String name;
  // String phone;
  // ScienceScreen({this.name,this.urlImage,this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, index) {},
      builder: (context, index) {
        var list = NewsCubit.get(context).Science;
        return Container(
          child: ListView.separated(
              itemBuilder: (context, index) => ListItem(list[index]),
              separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: .2,
                      color: Colors.blueGrey,
                    ),
                  ),
              itemCount: list.length),
        );
      },
    );
  }
}
