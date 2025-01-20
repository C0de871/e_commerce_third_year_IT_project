// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../data/model/get_users_model/data_model.dart';
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
