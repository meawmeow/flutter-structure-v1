class InputValidator {
  static String? validatorEmail(String val) {
    if (val.isEmpty) {
      return "Required";
    }
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val);
    if (!emailValid) {
      return "Enter correct email";
    }
  }

  static String? validatorPassword(String val) {
    if (val.isEmpty) {
      return "Required";
    }
    if (val.length < 6) {
      return "Password must be atleast 6 characters long";
    }
    if (val.length > 20) {
      return "Password must be less than 20 characters";
    }
    if (!val.contains(RegExp(r'[0-9]'))) {
      return "Password must contain a number";
    }
  }
}
