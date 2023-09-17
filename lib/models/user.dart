// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String uid;
  final String email;
  final String password;
  User({
    required this.uid,
    required this.email,
    required this.password,
  });

  User copyWith({
    String? uid,
    String? email,
    String? password,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(uid: $uid, email: $email, password: $password)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => Object.hash(uid, email, password);
  // Generated one: int get hashCode => uid.hashCode ^ email.hashCode ^ password.hashCode
}
