class FeedbackModel {
  String? name;
  String? email;
  String? desc;


  FeedbackModel({this.name, this.email, this.desc});

  // receiving data from server
  factory FeedbackModel.fromMap(map) {
    return FeedbackModel(
      name: map['name'],
      email: map['email'],
      desc: map['desc'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'desc': desc,

    };
  }
}