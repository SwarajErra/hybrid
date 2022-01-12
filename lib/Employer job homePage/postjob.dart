class postJob {
  String? jobType;
  String? companyName;
  String? CompanyLocation;
  String? jobDescription;
  double? payRate;
  postJob({this.jobType,this.companyName,this.payRate,this.CompanyLocation,this.jobDescription});

  // receiving data from server
  factory postJob.fromJson(Map<String, dynamic> json){
    return postJob(
      jobType : json['jobType'].toString(),

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'jobType': jobType.toString(),
      'companyName': companyName,
      'payRate': payRate.toString(),
      'CompanyLocation': CompanyLocation,
      'job Description': jobDescription,
      'pressAttention' : false

    };
  }
  static List<postJob> fromJsonArray(List<dynamic> jsonParts) {
    List<postJob> parts = [];
    jsonParts.forEach((jsonData) {

    });

    return parts;
  }
}