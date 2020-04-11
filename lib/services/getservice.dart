import 'package:thread/models/blogmodel.dart';
import 'package:thread/models/categoryinfo.dart';

class GetRecentBanner {
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
