// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAsylumDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AsylumDatabaseBuilder databaseBuilder(String name) =>
      _$AsylumDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AsylumDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AsylumDatabaseBuilder(null);
}

class _$AsylumDatabaseBuilder {
  _$AsylumDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AsylumDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AsylumDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AsylumDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AsylumDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AsylumDatabase extends AsylumDatabase {
  _$AsylumDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AsylumDao? _asylumnDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Asylum` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `latitude` INTEGER NOT NULL, `longitude` INTEGER NOT NULL, `about` TEXT NOT NULL, `instructions` TEXT NOT NULL, `openingHours` TEXT NOT NULL, `openOnWeekends` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AsylumDao get asylumnDao {
    return _asylumnDaoInstance ??= _$AsylumDao(database, changeListener);
  }
}

class _$AsylumDao extends AsylumDao {
  _$AsylumDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _asylumInsertionAdapter = InsertionAdapter(
            database,
            'Asylum',
            (Asylum item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'about': item.about,
                  'instructions': item.instructions,
                  'openingHours': item.openingHours,
                  'openOnWeekends': item.openOnWeekends ? 1 : 0
                }),
        _asylumUpdateAdapter = UpdateAdapter(
            database,
            'Asylum',
            ['id'],
            (Asylum item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'about': item.about,
                  'instructions': item.instructions,
                  'openingHours': item.openingHours,
                  'openOnWeekends': item.openOnWeekends ? 1 : 0
                }),
        _asylumDeletionAdapter = DeletionAdapter(
            database,
            'Asylum',
            ['id'],
            (Asylum item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'about': item.about,
                  'instructions': item.instructions,
                  'openingHours': item.openingHours,
                  'openOnWeekends': item.openOnWeekends ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Asylum> _asylumInsertionAdapter;

  final UpdateAdapter<Asylum> _asylumUpdateAdapter;

  final DeletionAdapter<Asylum> _asylumDeletionAdapter;

  @override
  Future<void> getById(int id) async {
    await _queryAdapter
        .queryNoReturn('SELECT * FROM Asylum WHERE id = ?', arguments: [id]);
  }

  @override
  Future<List<Asylum>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Asylum',
        mapper: (Map<String, Object?> row) => Asylum(
            row['id'] as int?,
            row['name'] as String,
            row['latitude'] as int,
            row['longitude'] as int,
            row['about'] as String,
            row['instructions'] as String,
            row['openingHours'] as String,
            (row['openOnWeekends'] as int) != 0));
  }

  @override
  Future<int> insertAsylum(Asylum item) {
    return _asylumInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateAsylum(Asylum item) {
    return _asylumUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteAsylum(Asylum item) {
    return _asylumDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
