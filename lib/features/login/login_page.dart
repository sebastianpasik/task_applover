import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_applover/features/loader_and_success/loader_and_success_page.dart';
import 'package:task_applover/helpers/fields_validator.dart';
import 'package:task_applover/utilities/appl_assets.dart';
import 'package:task_applover/utilities/appl_colors.dart';

import 'bloc/login_bloc.dart';

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
                SvgPicture.asset(
                  ApplAsset.apploverIcon,
                  color: Colors.white,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16.0),
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
                      context.read<LoginBloc>().add(const LoginEvent.saveData());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoaderAndSuccessPage(),
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

class GenericTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String labelText;
  final bool _obscureText;
  final Widget? sufixIcon;

  const GenericTextField({
    Key? key,
    this.controller,
    this.validator,
    this.sufixIcon,
    required this.labelText,
    bool obscureText = false,
  })  : _obscureText = obscureText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      obscureText: _obscureText,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: sufixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        labelText: labelText,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double height;
  final double width;
  final Color textColor;
  final BorderRadiusGeometry? borderRadius;

  const LoginButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.height = 50,
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(ApplColor.appLoverGreen),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.pressed) ? textColor.withAlpha(128) : null,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              side: const BorderSide(color: ApplColor.appLoverGreen),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
