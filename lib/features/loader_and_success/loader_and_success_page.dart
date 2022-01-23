import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_applover/features/login/bloc/login_bloc.dart';
import 'package:task_applover/utilities/appl_assets.dart';
import 'package:task_applover/utilities/appl_colors.dart';

class LoaderAndSuccessPage extends StatefulWidget {
  const LoaderAndSuccessPage({Key? key}) : super(key: key);

  @override
  _LoaderAndSuccessPageState createState() => _LoaderAndSuccessPageState();
}

class _LoaderAndSuccessPageState extends State<LoaderAndSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'app-lover',
                child: SvgPicture.asset(
                  ApplAsset.apploverIcon,
                  width: 150.0,
                  height: 150.0,
                  color: Colors.white,
                  cacheColorFilter: false,
                ),
              ),
              const SizedBox(height: 56.0),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {},
                bloc: context.read<LoginBloc>(),
                builder: (context, state) {
                  return state.maybeWhen(
                    dataSaved: () => const Center(
                        child: Text(
                      'Success!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                      ),
                    )),
                    loading: () => const CustomLinearIndicator(),
                    orElse: () => const CustomLinearIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLinearIndicator extends StatelessWidget {
  const CustomLinearIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: LinearProgressIndicator(
      backgroundColor: ApplColor.background,
      color: ApplColor.appLoverGreen,
      minHeight: 16,
    ));
  }
}
