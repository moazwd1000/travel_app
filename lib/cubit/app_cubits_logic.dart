import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_new/cubit/app_cubit.dart';
import 'package:travel_app_new/pages/detail_page.dart';
import 'package:travel_app_new/pages/home_page.dart';
import 'package:travel_app_new/pages/navigate/main_page.dart';
import 'package:travel_app_new/pages/welcome_screen.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomeScreen();
          }
          if (state is DetailState) {
            return DetailPage();
          }
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            return MainPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
