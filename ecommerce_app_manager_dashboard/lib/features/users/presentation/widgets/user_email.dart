import 'package:ecommerce_app_manager_dashboard/core/utils/constants/app_numbers.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/domain/entities/get_users_entity/data_entity.dart';
import 'package:flutter/material.dart';

class UserEmail extends StatelessWidget {
  const UserEmail({
    super.key,
    required this.user,
  });

  final DataEntity user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.email, size: 16),
        const SizedBox(width: padding4 * 2),
        Text(user.email),
      ],
    );
  }
}
