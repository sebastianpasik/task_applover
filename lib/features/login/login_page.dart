import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_applover/features/loader_and_success/loader_and_success_page.dart';
import 'package:task_applover/helpers/fields_validator.dart';
import 'package:task_applover/utilities/appl_assets.dart';

import 'bloc/login_bloc.dart';
import 'widgets/generic_text_field.dart';
import 'widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  final FieldsValidator _fieldsValidator = FieldsValidator();
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'app-lover',
                  child: SvgPicture.asset(
                    ApplAsset.apploverIcon,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                const SizedBox(height: 40.0),
                GenericTextField(
                  labelText: 'Email address',
                  controller: emailAddress,
                  validator: (text) => widget._fieldsValidator.validateEmail(text),
                ),
                const SizedBox(height: 16.0),
                GenericTextField(
                  labelText: 'Password',
                  controller: password,
                  validator: (text) => widget._fieldsValidator.validatePassword(text),
                  obscureText: hidePassword,
                  sufixIcon: IconButton(
                    icon: hidePassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                LoginButton(
                  text: 'Login',
                  onPressed: () => setState(() {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: context.read<LoginBloc>()
                              ..add(LoginEvent.saveData(emailAddress.text, password.text)),
                            child: const LoaderAndSuccessPage(),
                          ),
                        ),
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
