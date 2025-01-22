import 'package:ecommerce_app_manager_dashboard/core/helper/extensions.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/domain/entities/get_users_entity/data_entity.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/update_role_cubit/update_user_role_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Role extends StatelessWidget {
  const Role({
    super.key,
    required this.color,
    required this.role,
    required this.user,
    required this.parentContext,
  });

  final Color color;
  final String role;
  final DataEntity user;
  final BuildContext parentContext;

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
        parentContext.read<UpdateUserRoleCubit>().updateUserRole(userId: user.id, role: role);
      },
    );
  }
}
