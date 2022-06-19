class AboutUsModel {
  String? Name;
  String? Desc;
  String? Email;
  String? Profession;
  String? ContactNo;
  String? Image;

  AboutUsModel({this.Name, this.Desc ,this.Email, this.Profession, this.ContactNo,this.Image});

  // receiving data from server
  factory AboutUsModel.fromMap(map) {
    return AboutUsModel(
      Name: map['Name'],
      Desc: map['Desc'],
      Email: map['Email'],
      Profession: map['Profession'],
      ContactNo: map['ContactNo'],
      Image: map['Image'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'Desc': Desc,
      'Email': Email,
      'Profession': Profession,
      'ContactNo': ContactNo,
      'Image': Image,
    };
  }
}