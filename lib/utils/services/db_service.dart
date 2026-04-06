import 'package:demo_project/core/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:demo_project/core/helper/floor_db/db_helper.dart';
import 'package:demo_project/features/usermanagement/models/user.dart';
import 'package:demo_project/core/exceptions/app_exceptions.dart';

class DbService extends GetxService {
  DbService._privateConstructor();
  static final DbService _instance = DbService._privateConstructor();

  late AppDatabase _database;
  late UserDao _userDao;

  static Future<DbService> init() async {
    return await _instance._init();
  }

  static Future<int> insertUser(User user) async {
    return await _instance._insertUser(user);
  }

  static Future<int> updateUser(User user) async {
    return await _instance._updateUser(user);
  }

  static Future<void> deleteUser(int id) async {
    await _instance._deleteUser(id);
  }

  static Future<List<User>> getUsersPaginated({
    String? searchQuery,
    int page = 1,
    int limit = AppConstants.defaultPageSize,
  }) async {
    return await _instance._getUsersPaginated(
      searchQuery: searchQuery,
      page: page,
      limit: limit,
    );
  }

  static Future<bool> isEmailExists(String email, {int? excludeId}) async {
    return await _instance._isEmailExists(email, excludeId: excludeId);
  }

  static Future<void> deleteAllUsers() async {
    await _instance._deleteAllUsers();
  }

  // Private instance methods
  Future<DbService> _init() async {
    _database = await $FloorAppDatabase.databaseBuilder('users.db').build();
    _userDao = _database.userDao;
    return this;
  }

  Future<int> _insertUser(User user) async {
    try {
      return await _userDao.insertUser(user);
    } catch (e) {
      throw DatabaseException('Failed to insert user: $e');
    }
  }

  Future<int> _updateUser(User user) async {
    try {
      return await _userDao.updateUser(user);
    } catch (e) {
      throw DatabaseException('Failed to update user: $e');
    }
  }

  Future<void> _deleteUser(int id) async {
    await _userDao.deleteUserById(id);
  }

  Future<List<User>> _getUsersPaginated({
    String? searchQuery,
    int page = 1,
    int limit = AppConstants.defaultPageSize,
  }) async {
    final int offset = (page - 1) * limit;

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      final searchPattern = '%${searchQuery.trim()}%';
      return await _userDao.getPaginatedUsersSearch(
        searchPattern,
        limit,
        offset,
      );
    } else {
      return await _userDao.getPaginatedUsers(limit, offset);
    }
  }

  Future<bool> _isEmailExists(String email, {int? excludeId}) async {
    User? user;
    if (excludeId != null) {
      user = await _userDao.findUserByEmailExcludeId(email, excludeId);
    } else {
      user = await _userDao.findUserByEmail(email);
    }
    return user != null;
  }

  Future<void> _deleteAllUsers() async {
    await _userDao.deleteAllUsers();
    try {
      // Reset auto-increment counter in SQLite
      await _database.database.execute(
        'DELETE FROM sqlite_sequence WHERE name = "users"',
      );
    } catch (_) {
      // sqlite_sequence might not exist yet if no AUTOINCREMENT was used
    }
  }
}
