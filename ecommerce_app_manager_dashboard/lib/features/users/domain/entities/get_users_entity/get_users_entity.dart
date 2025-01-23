
import 'data_entity.dart';

class GetUsersEntity {
  bool successful;
  List<DataEntity> data;
  int statusCode;
  GetUsersEntity({
    required this.successful,
    required this.data,
    required this.statusCode,
  });
}
