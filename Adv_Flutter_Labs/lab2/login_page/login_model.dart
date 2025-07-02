class LoginModel{

  List<dynamic> userList = [];
  String? validateName( String value ) {
    if(value == null || value.isEmpty){
      return "Please enter valid Name";
    }
    else if(!(RegExp('[A-Z]').hasMatch(value))){
      return "Name must contain alphabet";
    }
    return null;
  }

  String? validateEmail( String value ) {
    if(value == null || value.isEmpty){
      return "Please enter valid Email";
    }
    else if(!(RegExp(r'^.+@.+\.com$').hasMatch(value))){
      return "Please enter valid Email";
    }
    return null;
  }

  String? validateNumber( String value ) {
    if(value == null || value.isEmpty){
      return "Please enter valid Number";
    }
    else if(!(RegExp('[0-9]').hasMatch(value))){
      return "Please enter valid Number";
    }
    return null;
  }

  String? validatePassword( String value ) {
    if(value == null || value.isEmpty){
      return "Please enter valid password";
    }
    return null;
  }

  String? validateConfrimPassword( String value  , String pass) {
    if(value == null || value.isEmpty){
      return "Please enter valid password";
    }
    else if(value != pass){
      return "Passwords do not match at all";
    }
    return null;
  }


  void addUser(user){
    if(!userList.contains(user)){
      userList.add(user);
    }
  }

  List<dynamic> getUser(){
    return userList;
  }
}