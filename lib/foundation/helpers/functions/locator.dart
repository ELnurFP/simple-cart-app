import 'package:azercell_task_application/foundation/state_logic/cubits/home/home_cubit.dart';
import 'package:azercell_task_application/foundation/state_logic/vanilla_blocs/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
final navigatorKey = GlobalKey<NavigatorState>();
final ctx = navigatorKey.currentContext;

Future<void> setupLocator() async {
  // STATE
  getIt.registerLazySingleton(() => AppBloc(), dispose: (i) => i.close());
  getIt.registerLazySingleton(() => HomeCubit(), dispose: (i) => i.close());
}
