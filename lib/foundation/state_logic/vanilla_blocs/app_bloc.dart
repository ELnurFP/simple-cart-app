import 'package:azercell_task_application/foundation/helpers/functions/locator.dart';
import 'package:azercell_task_application/foundation/models/data_containers/in_memory_store.dart';
import 'package:azercell_task_application/foundation/models/data_containers/user_info.dart';
import 'package:azercell_task_application/foundation/state_logic/vanilla_blocs/root_bloc.dart';
import 'package:azercell_task_application/presentation/screens/home/home_screen.dart';
import 'package:azercell_task_application/presentation/screens/auth/register_screen.dart';
import 'package:azercell_task_application/utilities/extensions/widget_extentions.dart';
import 'package:flutter/material.dart';

class AppBloc {
  RootBloc get _rootBloc => getIt<RootBloc>();

  final _userInfo = InMemoryStore<UserInfo?>(null);

  Stream<UserInfo?> get userInfo$ => _userInfo.stream;

  UserInfo? get userInfo => _userInfo.value;

  void updateUserInfo(UserInfo? event) => _userInfo.value = event;

  void close() {
    _userInfo.close();
  }

  Future<void> logUserOut() async {
    Navigator.of(ctx!)
        .pushAndRemoveUntil(const LoginScreen().route, (_) => false);

    _rootBloc.jumpToBnbTab(0);
    updateUserInfo(null);
  }

  void whenUserLoggedIn(UserInfo userInfo) {
    updateUserInfo(userInfo);
  }

  void logInAsGuest() {
    Navigator.of(ctx!).push(const HomeScreen().route);
  }
}
