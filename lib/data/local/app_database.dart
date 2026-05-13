import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const String _dbName = 'desktop_tools.db';
  static const int _version = 1;

  static Future<Database> open() async {
    final dir = await getApplicationSupportDirectory();
    final path = p.join(dir.path, _dbName);
    return openDatabase(
      path,
      version: _version,
      onCreate: (db, version) async {
        await _createTables(db);
        await _seedDefaultSettings(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Reserved for future migrations.
      },
    );
  }

  static Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        notes TEXT,
        due_at INTEGER,
        priority TEXT NOT NULL DEFAULT 'normal',
        completed INTEGER NOT NULL DEFAULT 0,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE pomodoro_sessions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        planned_seconds INTEGER NOT NULL,
        elapsed_seconds INTEGER NOT NULL,
        completed INTEGER NOT NULL,
        started_at INTEGER NOT NULL,
        ended_at INTEGER,
        todo_id INTEGER,
        mode TEXT NOT NULL,
        FOREIGN KEY(todo_id) REFERENCES todos(id) ON DELETE SET NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE settings (
        id INTEGER PRIMARY KEY CHECK(id = 1),
        focus_minutes INTEGER NOT NULL,
        short_break_minutes INTEGER NOT NULL,
        long_break_minutes INTEGER NOT NULL,
        long_break_every INTEGER NOT NULL,
        todo_reminder_minutes INTEGER NOT NULL,
        weather_city TEXT NOT NULL
      );
    ''');
  }

  static Future<void> _seedDefaultSettings(Database db) async {
    await db.insert('settings', {
      'id': 1,
      'focus_minutes': 25,
      'short_break_minutes': 5,
      'long_break_minutes': 15,
      'long_break_every': 4,
      'todo_reminder_minutes': 10,
      'weather_city': '北京',
    });
  }
}

