import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CacheManager {
  Future<Database> instance;
  Future<void> init() async {
    instance = openDatabase(
      join(await getDatabasesPath(), 'cache_database.db'),
      version: 1,
      onCreate: (db, version) {
        db?.execute(
          "CREATE TABLE dbprofile(id INTEGER PRIMARY KEY, name TEXT, height TEXT, bannerurl TEXT)",
        );
        db?.execute(
          "CREATE TABLE dbstats(id INTEGER, skill TEXT, total INTEGER, score INTEGER)",
        );
        db?.execute(
          "CREATE TABLE dbhighlights(id INTEGER, highlights TEXT)",
        );
      },
    );
  }

// Define a function that inserts dogs into the database
  Future<int> insertData<T>({
    @required T data,
    @required DB_Tables table,
  }) async {
    String dbname = getdbName(table);
    final Database db = await instance;
    return await db?.insert(
      dbname,
      (data as BaseModel).toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteDataAsync({
    @required int id,
    @required DB_Tables table,
  }) async {
    String dbname = getdbName(table);
    final Database db = await instance;
    return await db.delete(
      dbname,
      where: "id == $id",
      whereArgs: [id],
    );
  }

  String getdbName(
    DB_Tables table,
  ) {
    String dbname = "";
    switch (table) {
      case DB_Tables.Profile:
        dbname = 'dbprofile';
        break;
      case DB_Tables.Statistics:
        dbname = 'dbstats';
        break;
      case DB_Tables.Skills:
        dbname = 'dbhighlights';
        break;
    }
    return dbname;
  }

  Future<List<dynamic>> executeSelectAllQuery<T>({
    @required DB_Tables table,
    //@required Type data,
  }) async {
    String dbname = getdbName(table);
    final Database db = await instance;
    final List<Map<String, dynamic>> maps = await db.query(dbname);
    return List.generate(
      maps.length,
      (i) {
        if (T == Profile) {
          return Profile.getInstance(maps[i]);
        } else if (T == Statistics) {
          return Statistics.getInstance(maps[i]);
        } else
          return Profile.getInstance(maps[i]);
      },
    );
  }
}

class Profile implements BaseModel {
  final int id;
  final String name;
  final double height;
  Profile({this.id, this.name, this.height});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'height': height,
    };
  }

  factory Profile.fromJson(Map<String, dynamic> parsedJson) {
    return new Profile(
      id: parsedJson['id'],
      name: parsedJson['name'],
      height: double.parse(parsedJson['height']),
    );
  }

  static Profile getInstance(Map<String, dynamic> parsedJson) {
    return new Profile(
      id: parsedJson['id'],
      name: parsedJson['name'],
      height: double.parse(parsedJson['height']),
    );
  }
}

class Statistics extends BaseModel {
  final int id;
  final String skill;
  final double score;
  final double total;
  Statistics({
    this.id,
    this.skill,
    this.score,
    this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'skill': skill,
      'score': score,
      'total': total,
    };
  }

  factory Statistics.fromJson(Map<String, dynamic> parsedJson) {
    return new Statistics(
      id: parsedJson['id'],
      skill: parsedJson['name'],
      score: double.parse(parsedJson['score']),
      total: double.parse(parsedJson['total']),
    );
  }
  static Statistics getInstance(Map<String, dynamic> parsedJson) {
    return new Statistics(
      id: parsedJson['id'],
      skill: parsedJson['name'],
      score: parsedJson['score'].toDouble(),
      total: parsedJson['total'].toDouble(),
    );
  }
}

class BaseModel {
  Map<String, dynamic> toMap() {
    return {};
  }
}

enum DB_Tables {
  Profile,
  Statistics,
  Skills,
}
