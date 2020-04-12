import 'package:thread/models/blogmodel.dart';

class ProfileModel {
  String name;
  String profileurl;
  String bannerurl;
  List<BlogModel> recentblogs;
  ProfileModel({
    this.name,
    this.profileurl,
    this.bannerurl,
    this.recentblogs,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> parsedJson) {
    return new ProfileModel(
      name: parsedJson['name'],
      profileurl: parsedJson['profileurl'],
      bannerurl: parsedJson['bannerurl'],
      recentblogs: (parsedJson['recentblogs'] as List)
          .map((i) => BlogModel.fromJson(i))
          .toList(),
    );
  }
}
