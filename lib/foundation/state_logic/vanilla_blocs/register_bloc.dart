import 'package:azercell_task_application/foundation/helpers/functions/debugging.dart';
import 'package:azercell_task_application/foundation/helpers/functions/locator.dart';
import 'package:azercell_task_application/foundation/models/data_containers/user_info.dart';
import 'package:azercell_task_application/foundation/state_logic/vanilla_blocs/app_bloc.dart';
import 'package:flutter/material.dart';

class RegisterBloc {
  AppBloc get _appBloc => getIt<AppBloc>();

  final _busy = ValueNotifier(false);
  ValueNotifier<bool> get busy => _busy;
  void _updateBusy({required bool value}) => _busy.value = value;

  void close() {
    _busy.dispose();
  }

  Future<bool> register(UserInfo userInfo) async {
    bool flag = false;

    _updateBusy(value: true);
    try {
      flag = true;
      _appBloc.whenUserLoggedIn(userInfo);
    } catch (e, s) {
      logError(e, s);
    } finally {
      _updateBusy(value: false);
    }

    return flag;
  }
}
