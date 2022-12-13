import 'package:amiraapp/shared/cubit/cubit.dart';
import 'package:amiraapp/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:amiraapp/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController;
  var passController;
  Color color = Colors.purple;
  Color colorblack = Colors.black;
  var formKey = GlobalKey();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, Appstates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
            body: CircleAvatar(
              radius: double.infinity,
              backgroundColor: Colors.grey.shade100,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: 400,
                    height: 300,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Components().TextEdit(
                              'Enter Gmail',
                              Icon(
                                Icons.email,
                                color: colorblack,
                              ),
                              TextInputType.text,
                              emailController,
                              TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 30,
                          ),
                          Components().TextEdit(
                              'Enter Password',
                              Icon(
                                Icons.lock,
                                color: colorblack,
                              ),
                              TextInputType.text,
                              passController,
                              TextStyle(fontSize: 20),
                              suffex: isPasswordShow
                                  ? Icon(
                                      Icons.remove_red_eye,
                                      color: colorblack,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: colorblack,
                                    ),
                              scure: true, validate: (value) {
                            if (value.isEmpty) {
                              return "password must\'t be empty";
                            }
                            return null;
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                AppCubit.get(context).change(context);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.purple,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
