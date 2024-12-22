class Datauser {
  String docid;
  String imageURL;
  String Username;
  String Gender;
  String mobile;
  String Address;

  Datauser(
      {required this.docid,
      required this.imageURL,
      required this.Username,
      required this.Gender,
      required this.mobile,
      required this.Address});

  toMap() {
    Map<String, dynamic> map = Map();
    map['docid'] = docid;
    map['imageURL'] = imageURL;
    map['Username'] = Username;
    map['Gender'] = Gender;
    map['mobile'] = mobile;
    map['Address'] = Address;
    return map;
  }
}
