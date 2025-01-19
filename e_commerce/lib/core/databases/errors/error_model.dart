import '../api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData[ApiKey.message],
      status: 200,
      //todo:
      // status: jsonData[ApiKey.statusCode],
    );
  }
}
