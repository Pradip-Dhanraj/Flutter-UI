import 'package:thread/models/blogmodel.dart';
import 'package:thread/models/categoryinfo.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:thread/models/profile.dart';

class AppServices {
  static Future<String> _getJsonProfileData() async {
    return await rootBundle.loadString('assets/jsons/profiledata.json');
  }

  static Future<ProfileModel> getProfileData() async {
    await Future.delayed(Duration(seconds: 5)); //Mock delay
    var jsonString = await _getJsonProfileData();
    final jsonResponse = json.decode(jsonString);
    ProfileModel profileModel = new ProfileModel.fromJson(jsonResponse);
    return profileModel;
  }
//  static Future<ProfileModel> getProfileDataz() async {
//     var jsonString = await _getJsonProfileData();
//     final jsonResponse = json.decode(jsonString).cast<Map<String, dynamic>>();
//     ProfileModel profileModel = jsonResponse.map<ProfileModel>((json)=>{ProfileModel.fromJson(json)});
//     return profileModel;
//   }

  static List<BlogModel> recetblogslist = [
    BlogModel(title: "Qurantine day 1", createddate: "10/5/2020"),
    BlogModel(title: "Qurantine day 1", createddate: "10/5/2020"),
    BlogModel(title: "Qurantine day 1", createddate: "10/5/2020"),
    BlogModel(title: "Qurantine day 1", createddate: "10/5/2020"),
    BlogModel(title: "Qurantine day 1", createddate: "10/5/2020"),
    BlogModel(title: "Qurantine day 1", createddate: "10/5/2020"),
    BlogModel(title: "Qurantine day 1", createddate: "10/5/2020"),
    BlogModel(title: "Qurantine day 1", createddate: "10/5/2020"),
  ];

  static List<CategoryInfo> categoryInfo = [
    CategoryInfo(
      title: "Profile",
      total: 100,
      completed: 70,
    ),
    CategoryInfo(
      title: "Blogs",
      total: 0,
      completed: 4,
      message: '4 active',
    ),
    CategoryInfo(
      title: "Pictures",
      total: 0,
      completed: 17,
      message: '17 posts',
    ),
    CategoryInfo(
      title: "Notification",
      total: 0,
      completed: 70,
      message: '10+',
    ),
  ];
}
