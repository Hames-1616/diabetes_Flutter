import 'dart:convert';

class CreateUser {
  String username;
  String email;
  String password;
  CreateUser({
    required this.username,
    required this.email,
    required this.password,
  });
  
  CreateUser copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return CreateUser(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'password': password});
  
    return result;
  }

  factory CreateUser.fromMap(Map<String, dynamic> map) {
    return CreateUser(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateUser.fromJson(String source) => CreateUser.fromMap(json.decode(source));

  @override
  String toString() => 'CreateUser(username: $username, email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CreateUser &&
      other.username == username &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ password.hashCode;
}
