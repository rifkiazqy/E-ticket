class User {
  String _name;
  String _email;
  String _password;

  User(this._name, this._email, this._password);

  User.create({
    required String name,
    required String email,
    required String password,
  })  : _name = name,
        _email = email,
        _password = password;

 
  String get name => _name;
  String get email => _email;
  String get password => _password;

  
  set name(String newName) {
    if (newName.isNotEmpty) _name = newName;
  }

  set password(String newPassword) {
    if (newPassword.length >= 6) _password = newPassword;
  }

  // Polymorphism contoh
  String getRole() => "Regular User";
}

class AdminUser extends User {
  AdminUser(String name, String email, String password)
      : super(name, email, password);

  @override
  String getRole() => "Administrator";
}
