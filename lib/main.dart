import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_applover/features/login/bloc/login_bloc.dart';
import 'package:task_applover/utilities/appl_colors.dart';

import 'DI/dependencies_injection.dart';
import 'features/login/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const TaskApplover());
}

class TaskApplover extends StatelessWidget {
  const TaskApplover({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          hintColor: Colors.white,
          primaryColor: Colors.white,
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.white),
          scaffoldBackgroundColor: ApplColor.background,
        ),
        home: LoginPage(),
      ),
    );
  }
}
