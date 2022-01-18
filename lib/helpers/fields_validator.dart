class FieldsValidator {
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "E-mail is required";
    }
    if (!email.isValidEmail()) {
      return "Invalid email address";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    if (password.length < 6) {
      return "Password has to have 6 letters minimum";
    }
    return null;
  }
}

extension _EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
