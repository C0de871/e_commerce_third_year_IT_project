import 'package:ecommerce_app_manager_dashboard/core/utils/constants/app_numbers.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/domain/entities/get_users_entity/data_entity.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/widgets/user_current_role.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/widgets/user_email.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/widgets/user_phone.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.user,
  });

  final DataEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${user.firstName} ${user.lastName}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: padding4 * 2),
        UserCurrentRole(user: user),
        const SizedBox(height: padding4 * 2),
        UserEmail(user: user),
        const SizedBox(height: padding4),
        UserPhone(user: user),
      ],
    );
  }
}
