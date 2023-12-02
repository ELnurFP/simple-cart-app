import 'package:azercell_task_application/foundation/models/data_containers/user_info.dart';
import 'package:azercell_task_application/foundation/state_logic/vanilla_blocs/register_bloc.dart';
import 'package:azercell_task_application/presentation/screens/home/home_screen.dart';
import 'package:azercell_task_application/presentation/screens/auth/widgets/register_form.dart';
import 'package:azercell_task_application/presentation/widgets/functional/light_status_bar.dart';
import 'package:azercell_task_application/presentation/widgets/styled/styled_button.dart';
import 'package:azercell_task_application/utilities/extensions/widget_extentions.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _registerBloc = RegisterBloc();
  final _formGroup = fb.group({
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'surname': FormControl<String>(
      validators: [Validators.required],
    ),
    'birth_date': FormControl<String>(
      validators: [Validators.required],
    ),
    'gsm_number': FormControl<String>(
      validators: [Validators.required],
    ),
  });

  @override
  void dispose() {
    _formGroup.dispose();
    _registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LightStatusbar(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          const Text(
            'Register',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          const SizedBox(height: 24.0),
          ResgisterForm(_formGroup),
          const SizedBox(height: 32.0),
          _buildLoginButton(),
        ],
      ).padTop(60),
    );
  }

  Widget _buildLoginButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: _registerBloc.busy,
      builder: (context, bool value, _) {
        return StyledButton(
          textColor: Colors.white,
          busy: value,
          title: 'Register',
          onTap: () async {
            if (_formGroup.valid) {
              final username = _formGroup.control('name').value as String;
              final surname = _formGroup.control('surname').value as String;
              final birthDate =
                  _formGroup.control('birth_date').value as String;
              final gsmNumber =
                  _formGroup.control('gsm_number').value as String;

              final navigator = Navigator.of(context);
              final success = await _registerBloc.register(
                UserInfo(
                  name: username,
                  surname: surname,
                  birthDate: birthDate,
                  gsmNumber: gsmNumber,
                ),
              );

              if (success) {
                navigator.pushAndRemoveUntil(
                  const HomeScreen().route,
                  (route) => false,
                );
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Register failed'),
                    ),
                  );
                }
              }
            } else {
              _formGroup.markAllAsTouched();
            }
          },
        );
      },
    );
  }
}
