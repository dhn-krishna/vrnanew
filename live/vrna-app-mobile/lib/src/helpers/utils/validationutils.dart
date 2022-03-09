class ValidationUtils {
  static bool validateEmail(String email) {
    return (email.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email));
  }

  static bool validatePassword(String pwd) {
    return (pwd.isNotEmpty &&
        pwd.length >= 8 &&
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*]).{8,}$')
            .hasMatch(pwd));
  }

  static bool validateMobile(String mobile) {
    return (mobile.isNotEmpty &&
        mobile.length == 10 &&
        RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(mobile));
  }
}
