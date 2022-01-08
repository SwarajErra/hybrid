class postJob {
  String? jobType;

  postJob({this.jobType});

  // receiving data from server
  factory postJob.fromJson(Map<String, dynamic> json){
    return postJob(
      jobType : json['jobType'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'jobType': jobType,
    };
  }
  static List<postJob> fromJsonArray(List<dynamic> jsonParts) {
    List<postJob> parts = [];
    jsonParts.forEach((jsonData) {

    });

    return parts;
  }
}