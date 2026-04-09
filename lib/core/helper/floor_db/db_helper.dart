import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:demo_project/features/usermanagement/models/user.dart';

part 'db_helper.g.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM users ORDER BY user_id DESC')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM users WHERE LOWER(email) = LOWER(:email) LIMIT 1')
  Future<User?> findUserByEmail(String email);

  @Query(
    'SELECT * FROM users WHERE LOWER(email) = LOWER(:email) AND user_id != :excludeId LIMIT 1',
  )
  Future<User?> findUserByEmailExcludeId(String email, int excludeId);

  @Query(
    'SELECT * FROM users WHERE first_name LIKE :search OR last_name LIKE :search OR email LIKE :search ORDER BY user_id DESC LIMIT :limit OFFSET :offset',
  )
  Future<List<User>> getPaginatedUsersSearch(
    String search,
    int limit,
    int offset,
  );

  @Query(
    'SELECT * FROM users ORDER BY user_id DESC LIMIT :limit OFFSET :offset',
  )
  Future<List<User>> getPaginatedUsers(int limit, int offset);

  @insert
  Future<int> insertUser(User user);

  @update
  Future<int> updateUser(User user);

  @Query('DELETE FROM users WHERE user_id = :id')
  Future<void> deleteUserById(int id);

  @Query('DELETE FROM users')
  Future<void> deleteAllUsers();
}

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
