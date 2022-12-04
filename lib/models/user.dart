import 'package:conduit/conduit.dart';

class User extends ManagedObject<_User> implements _User {}

class _User {
  @primaryKey
  int? id;
  @Column(unique: true, indexed: true)
  String? username;
  @Column(unique: true, indexed: true)
  String? email;
  @Serialize(
      input: true, output: false) // Можем получить данные, но хранить не будем
  String? password;
  @Column(nullable: true)
  String? accessToken;
  @Column(nullable: true)
  String? refreshToken;
  @Column(
      omitByDefault: true) //Данные будем записывать в БД, но выдавать не будем
  String? salt;
  @Column(omitByDefault: true)
  String? hashPassword;
}
