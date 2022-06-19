class FeedbackModel {
  String? Name;
  String? Email;
  String? Desc;


  FeedbackModel({this.Name, this.Email, this.Desc});

  // receiving data from server
  factory FeedbackModel.fromMap(map) {
    return FeedbackModel(
      Name: map['Name'],
      Email: map['Email'],
      Desc: map['Desc'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'Email': Email,
      'Desc': Desc,

    };
  }
}