import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Routes/app_routes.dart';
import '../cubit/check_first_launch/check_first_launch_cubit.dart';
import '../cubit/get_last_user_cubit/get_last_user_cubit.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CheckFirstLaunchCubit>().checkFirstLaunch();
  }

  @override
  Widget build(BuildContext context) {
    log("in the loading screen build method");
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<CheckFirstLaunchCubit, CheckFirstLaunchState>(
            listener: (context, state) async {
              if (state is CheckFirstLaunchLoaded) {
                if (state.isFirstLaunch) {
                  await Future.delayed(Duration(seconds: 2));
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.splashRoute);
                  }
                } else {
                  context.read<GetLastUserCubit>().getLastUser();
                }
              }
            },
          ),
          BlocListener<GetLastUserCubit, GetLastUserState>(
            listener: (context, state) async {
              if (state is UserLoaded) {
                await Future.delayed(Duration(seconds: 5));
                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, AppRoutes.pageView);
                }
              } else if (state is NoUserFound) {
                await Future.delayed(Duration(seconds: 5));
                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
                }
              }
            },
          ),
        ],
        child: Center(
          child: Lottie.asset('assets/lottie/motor.json'),
        ),
      ),
    );
  }
}
