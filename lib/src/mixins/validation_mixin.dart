class ValidationMixin{

  String validateEmail(value){
    // return null if valid
    // otherwise return string with error message.
    if(!value.contains('@')||!value.contains(".com")){
      return 'Error, Invalid Email!';
    }
    return null;
  }


  String validatePassword(value){
    if(value.length<4){
      return 'Password must contain atleast four characters. ';
    }
    return null;
  }
}