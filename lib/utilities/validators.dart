class Validator {
  static String? emailValidator(String? val) {
    if (val == null || val.isEmpty) {
      return "Please enter your email";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(val);
    if (!emailValid) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? passwordValidator(String? val) {
    if (val == null || val.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }
}
