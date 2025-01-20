import 'package:ecommerce_app_manager_dashboard/core/helper/extensions.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/domain/entities/get_users_entity/data_entity.dart';
import 'package:flutter/material.dart';

class Role extends StatelessWidget {
  const Role({
    super.key,
    required this.color,
    required this.role,
    required this.user,
  });

  final Color color;
  final String role;
  final DataEntity user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        radius: 12,
      ),
      title: Text(role.capitalize()),
      selected: user.role?.toLowerCase() == role,
      onTap: () {
        // context.read<GetUsersCubit>().updateUserRole(
        //       userId: user.id,
        //       newRole: role,
        //     );
        Navigator.of(context).pop();
      },
    );
  }
}
