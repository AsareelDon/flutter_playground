import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String id;
  final String username;
  final String name;
  final String password;
  final String email;

  const AccountEntity({
    required this.id,
    required this.username,
    required this.name,
    required this.password,
    required this.email
  });

  @override
  List<Object?> get props => [id, username, name, password, email];
}