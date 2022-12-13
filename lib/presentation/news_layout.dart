import 'package:amiraapp/Business_logic/cubit/cubit.dart';
import 'package:amiraapp/Business_logic/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class News_layout extends StatelessWidget {
  static const String MaterialNamed = "news";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()
        ..getSpoert()
        ..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent.shade100,
              title: Text(
                "News App",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 10,
                onTap: (value) {
                  cubit.changeNavItemState(value);
                },
                selectedItemColor: Colors.deepPurpleAccent,
                currentIndex: cubit.click,
                items: [
                  BottomNavigationBarItem(
                      label: "",
                      icon: Icon(
                        Icons.business,
                        size: 30,
                      )),
                  BottomNavigationBarItem(
                      label: "",
                      icon: Icon(
                        Icons.sports,
                        size: 30,
                      )),
                  BottomNavigationBarItem(
                      label: "",
                      icon: Icon(
                        Icons.science,
                        size: 30,
                      )),
                ]
                //cubit.BottomNavItem,
                ),
            drawer: Drawer(),
            body: cubit.screens[cubit.click],
          );
        },
      ),
    );
  }
}
