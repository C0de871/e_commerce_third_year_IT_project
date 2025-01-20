import 'package:ecommerce_app_manager_dashboard/core/utils/constants/app_numbers.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/domain/entities/get_users_entity/data_entity.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/widgets/user_details.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final DataEntity user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: padding4 * 4),
      child: Padding(
        padding: const EdgeInsets.all(padding4 * 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserImage(user: user),
            const SizedBox(width: padding4 * 4),
            Expanded(
              child: UserDetails(user: user),
            ),
          ],
        ),
      ),
    );
  }
}
