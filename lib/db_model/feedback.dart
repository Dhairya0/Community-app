class FeedbackModel {
  String? name;
  String? email;
  String? suggestion;


  FeedbackModel({this.name, this.email, this.suggestion});

  // receiving data from server
  factory FeedbackModel.fromMap(map) {
    return FeedbackModel(
      name: map['name'],
      email: map['email'],
      suggestion: map['suggestion'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'suggestion': suggestion,

    };
  }
}