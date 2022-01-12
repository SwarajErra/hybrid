class profileAdd {
  String? first_name;
  String? last_name;
  String? address;
  int? mobile;
  String? email;
  String? education;
  String? experience;

  profileAdd(
  {
    this.first_name,
    this.last_name,
    this.address,
    this.mobile,
    this.email,
    this.education,
    this.experience
});
  factory profileAdd.fromJson(Map<String, dynamic> json){
    return profileAdd(
      first_name : json['first_name'].toString(),

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'first_name': first_name.,
      'last_name': last_name,
      'address': address,
      'mobile': mobile.toString()
      'email': email,
      'education': education,
      'experience': experience

    };
  }
  static List<profileAdd> fromJsonArray(List<dynamic> jsonParts) {
    List<profileAddb> parts = [];
    jsonParts.forEach((jsonData) {

    });

    return parts;
  }
}
