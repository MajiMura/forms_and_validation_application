class ValidationMixin {
  String? validateEmail(String? value) {
    if (value != null) {
      if (!value.contains('@')) {
        return "Not a valid email address.";
      }
      return null;
    }
    return "Information required";
  }

  String? validatePassword (String? value) {
    if(value != null){
      if(value.length < 4){
        return "Password must be at least 4 characters.";
      }
      return null;
    }
    return "Password must be at least 4 characters.";
  }
}
