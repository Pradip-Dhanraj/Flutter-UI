import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thread/customwidgets/delayedanimation.dart';
import 'package:thread/customwidgets/rotationanimation.dart';
import 'package:thread/helper/theme.dart';
import 'package:thread/services/cachemanger.dart';

class CreateBlog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateBlogState();
}

class CreateBlogState extends State<CreateBlog> with TickerProviderStateMixin {
  String time;
  CacheManager _cachemanager;
  bool _synced;
  void initState() {
    super.initState();
    _cachemanager = CacheManager();
    _synced = false;
  }

  Future<Void> _setupdb() async {
    await Future.delayed(Duration(seconds: 5));
    await _cachemanager?.init();
    setState(() {
      _synced = true;
    });
  }

  Future<List<dynamic>> getalldata<T>({
    @required DB_Tables db_tables,
  }) async {
    var l = await _cachemanager.executeSelectAllQuery<T>(
      table: db_tables,
    );
    return l;
  }

  void updateTime() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        time =
            "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().second}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shade01,
      body: Center(
        child: FutureBuilder<Void>(
          builder: (buildcontext, snapshot) {
            return _synced
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Insert query"),
                        onPressed: () async {
                          var profilecount = await _cachemanager?.insertData(
                              data: Profile(
                                name: 'Pradip',
                                id: 1,
                                height: 5.9,
                              ),
                              table: DB_Tables.Profile);
                          var statscount = await _cachemanager?.insertData(
                              data: Statistics(
                                skill: 'test',
                                id: 1,
                                total: 34.4,
                                score: 23.5,
                              ),
                              table: DB_Tables.Statistics);
                          print("stats count $statscount");
                        },
                      ),
                      RaisedButton(
                        child: Text("Select all query"),
                        onPressed: () async {
                          var l = await getalldata<Profile>(
                              db_tables: DB_Tables.Profile);
                          var l1 = await getalldata<Statistics>(
                              db_tables: DB_Tables.Statistics);
                        },
                      ),
                      RaisedButton(
                        child: Text("Delete id 1 query"),
                        onPressed: () async {
                          var countprof = await _cachemanager.deleteDataAsync(
                            id: 1,
                            table: DB_Tables.Profile,
                          );
                          print("profile deleted count $countprof");
                          var countstats = await _cachemanager.deleteDataAsync(
                            id: 1,
                            table: DB_Tables.Statistics,
                          );
                          print("profile deleted count $countstats");
                        },
                      )
                    ],
                  )
                : CircularProgressIndicator();
          },
          future: _setupdb(),
        ),
      ),
    );
  }
}
