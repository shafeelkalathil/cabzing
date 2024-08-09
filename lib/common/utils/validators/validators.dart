class CAppValidators{

  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return 'Email is required';
    }

    final RegExp emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
    );

    if(!emailRegex.hasMatch(value)){
      return 'Invalid email address';
    }

    return null;
  }

  static String? validateField(String? value,String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return "Password must be 6 character long";
    }

    return null;
  }
}