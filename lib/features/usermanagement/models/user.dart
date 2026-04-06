import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class User {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'user_id')
  final int? id;

  @ColumnInfo(name: 'first_name')
  final String firstName;

  @ColumnInfo(name: 'last_name')
  final String lastName;

  @ColumnInfo(name: 'birth_date')
  final String birthDate;

  @ColumnInfo(name: 'email')
  final String email;

  @ColumnInfo(name: 'password')
  final String password;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.email,
    required this.password,
  });
}
