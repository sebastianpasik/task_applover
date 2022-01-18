import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_applover/features/loader_and_success/loader_and_success_page.dart';
import 'package:task_applover/helpers/fields_validator.dart';
import 'package:task_applover/utilities/appl_assets.dart';
import 'package:task_applover/utilities/appl_colors.dart';

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
        backgroundColor: ApplColor.background,
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
                TextFormField(
                  controller: emailAddress,
                  style: const TextStyle(color: Colors.white),
                  validator: (text) => widget._fieldsValidator.validateEmail(text),
                  decoration: InputDecoration(
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
                    labelText: 'Email address',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: password,
                  style: const TextStyle(color: Colors.white),
                  obscureText: hidePassword,
                  validator: (text) => widget._fieldsValidator.validatePassword(text),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: hidePassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
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
                    labelText: 'Password',
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
                            builder: (context) => const LoaderAndSuccessPage(),
                          ));
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
  const GenericTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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
