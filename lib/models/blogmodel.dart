class BlogModel {
  String blogbanner;
  String title;
  String createddate;
  BlogModel({this.blogbanner, this.title, this.createddate});

  factory BlogModel.fromJson(Map<String, dynamic> parsedJson) {
    return new BlogModel(
      blogbanner: parsedJson['blogbanner'],
      title: parsedJson['title'],
      createddate: parsedJson['createddate'],
    );
  }
}
