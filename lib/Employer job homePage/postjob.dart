class postJob {
  String? jobType;

  postJob({this.jobType});

  // receiving data from server
  factory postJob.fromMap(map) {
    return postJob(
      jobType : map['jobType'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'jobType': jobType,
    };
  }
}