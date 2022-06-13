class NewsModel {
  String? Title;
  String? Desc;


  NewsModel({this.Title, this.Desc});

  // receiving data from server
  factory NewsModel.fromMap(map) {
    return NewsModel(
      Title: map['Title'],
      Desc: map['Desc'],
      );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'Title': Title,
      'Desc': Desc,
    };
  }
}