import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_new/cubit/app_cubit.dart';
import 'package:travel_app_new/cubit/app_cubits_logic.dart';
import 'package:travel_app_new/pages/detail_page.dart';
import 'package:travel_app_new/pages/navigate/main_page.dart';
import 'package:travel_app_new/pages/welcome_screen.dart';
import 'package:travel_app_new/services/data_services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(
        data: DataServices(),
      ),
      child: AppCubitLogic(),
    );
  }
}
