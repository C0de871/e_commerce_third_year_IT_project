import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';

class MessageModel extends MessageEntity {
  MessageModel({required super.message});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json[ApiKey.message],
    );
  }
}
