import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_applover/features/login/bloc/login_bloc.dart';
import 'package:task_applover/utilities/appl_assets.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                ApplAsset.apploverIcon,
                color: Colors.white,
              ),
              const SizedBox(height: 16.0),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {},
                child: BlocBuilder<LoginBloc, LoginState>(
                  bloc: context.read<LoginBloc>(),
                  builder: (context, state) {
                    return state.maybeWhen(
                      dataSaved: () => const Center(child: Text('Success')),
                      loading: () => const CircularProgressIndicator(),
                      orElse: () => const CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
