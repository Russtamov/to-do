import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/product/database/hive/constants/hive_database_constants.dart';

@immutable
final class HiveDatabaseManager {
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveDatabaseConstants.toDoBox);
  }

  Box get _todoBox => Hive.box(HiveDatabaseConstants.toDoBox);

  Future<void> insertTask(Map<String, dynamic> task) async {
    await _todoBox.add(task);
  }

  List<Map<String, dynamic>> fetchTasks() {
    return _todoBox.keys.map((key) {
      final item = _todoBox.get(key);
      return {
        'id': key,
        'title': item['title'],
        'description': item['description'],
      };
    }).toList();
  }

  Future<void> updateTask(Map<String, dynamic> task) async {
    await _todoBox.put(task['id'], {
      'title': task['title'],
      'description': task['description'],
    });
  }

  Future<void> deleteTask(int id) async {
    await _todoBox.delete(id);
  }
}
