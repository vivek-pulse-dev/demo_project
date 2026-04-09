// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_helper.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`user_id` INTEGER PRIMARY KEY AUTOINCREMENT, `first_name` TEXT NOT NULL, `last_name` TEXT NOT NULL, `birth_date` TEXT NOT NULL, `email` TEXT NOT NULL, `password` TEXT NOT NULL)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_users_email` ON `users` (`email`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (User item) => <String, Object?>{
                  'user_id': item.id,
                  'first_name': item.firstName,
                  'last_name': item.lastName,
                  'birth_date': item.birthDate,
                  'email': item.email,
                  'password': item.password
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'users',
            ['user_id'],
            (User item) => <String, Object?>{
                  'user_id': item.id,
                  'first_name': item.firstName,
                  'last_name': item.lastName,
                  'birth_date': item.birthDate,
                  'email': item.email,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  @override
  Future<List<User>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM users ORDER BY user_id DESC',
        mapper: (Map<String, Object?> row) => User(
            id: row['user_id'] as int?,
            firstName: row['first_name'] as String,
            lastName: row['last_name'] as String,
            birthDate: row['birth_date'] as String,
            email: row['email'] as String,
            password: row['password'] as String));
  }

  @override
  Future<User?> findUserByEmail(String email) async {
    return _queryAdapter.query(
        'SELECT * FROM users WHERE LOWER(email) = LOWER(?1) LIMIT 1',
        mapper: (Map<String, Object?> row) => User(
            id: row['user_id'] as int?,
            firstName: row['first_name'] as String,
            lastName: row['last_name'] as String,
            birthDate: row['birth_date'] as String,
            email: row['email'] as String,
            password: row['password'] as String),
        arguments: [email]);
  }

  @override
  Future<User?> findUserByEmailExcludeId(
    String email,
    int excludeId,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM users WHERE LOWER(email) = LOWER(?1) AND user_id != ?2 LIMIT 1',
        mapper: (Map<String, Object?> row) => User(id: row['user_id'] as int?, firstName: row['first_name'] as String, lastName: row['last_name'] as String, birthDate: row['birth_date'] as String, email: row['email'] as String, password: row['password'] as String),
        arguments: [email, excludeId]);
  }

  @override
  Future<List<User>> getPaginatedUsersSearch(
    String search,
    int limit,
    int offset,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM users WHERE first_name LIKE ?1 OR last_name LIKE ?1 OR email LIKE ?1 ORDER BY user_id DESC LIMIT ?2 OFFSET ?3',
        mapper: (Map<String, Object?> row) => User(id: row['user_id'] as int?, firstName: row['first_name'] as String, lastName: row['last_name'] as String, birthDate: row['birth_date'] as String, email: row['email'] as String, password: row['password'] as String),
        arguments: [search, limit, offset]);
  }

  @override
  Future<List<User>> getPaginatedUsers(
    int limit,
    int offset,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM users ORDER BY user_id DESC LIMIT ?1 OFFSET ?2',
        mapper: (Map<String, Object?> row) => User(
            id: row['user_id'] as int?,
            firstName: row['first_name'] as String,
            lastName: row['last_name'] as String,
            birthDate: row['birth_date'] as String,
            email: row['email'] as String,
            password: row['password'] as String),
        arguments: [limit, offset]);
  }

  @override
  Future<void> deleteUserById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM users WHERE user_id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteAllUsers() async {
    await _queryAdapter.queryNoReturn('DELETE FROM users');
  }

  @override
  Future<int> insertUser(User user) {
    return _userInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateUser(User user) {
    return _userUpdateAdapter.updateAndReturnChangedRows(
        user, OnConflictStrategy.abort);
  }
}
