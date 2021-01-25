class User {
  final String id;
  final String username;
  final String email;
  final String password;

  User ({this.id, this.username, this.email, this.password, uid});

  User.fromData(Map<String, dynamic> data)
      : id = data['uid'],
        username = data['username'],
        email = data['email'],
        password = data['password'];

  Map<String,dynamic> toJson(){
    return{
      'uid' : id,
      'username' : username,
      'email' : email,
      'password' : password
    };
  }
}

class UserData {
  final String id;
  final String username;
  final String email;
  final String password;

  UserData ({this.id, this.username, this.email, this.password, uid});
}

