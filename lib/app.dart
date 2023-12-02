import 'package:azercell_task_application/presentation/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'utilities/exports/functions.dart';
import 'utilities/exports/widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        ErrorWidget.builder = errorWidgetBuilder;
        return ScrollConfiguration(
          behavior: const StyledScrollBehavior(),
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          ),
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Azercell Task Application',
      themeMode: ThemeMode.dark,
      home: const LoginScreen(),
    );
  }
}
