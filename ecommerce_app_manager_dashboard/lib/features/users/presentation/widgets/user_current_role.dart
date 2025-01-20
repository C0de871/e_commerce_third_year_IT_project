import 'package:ecommerce_app_manager_dashboard/core/utils/constants/app_numbers.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/domain/entities/get_users_entity/data_entity.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/dashboard_body.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/widgets/role.dart';
import 'package:flutter/material.dart';

class UserCurrentRole extends StatelessWidget {
  const UserCurrentRole({
    super.key,
    required this.user,
  });

  final DataEntity user;

  static const Map<String, Color> roleColors = {
    'store_admin': Colors.blue,
    'manager': Colors.green,
    'user': Colors.orange,
    'guest': Colors.grey,
  };

  Color getRoleColor(String? role) {
    if (role == null) return Colors.grey;
    return roleColors[role.toLowerCase()] ?? Colors.grey;
  }

  void _showRoleSelectionDialog(BuildContext context, DataEntity user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Role'),
          content: SizedBox(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: roleColors.length,
              itemBuilder: (context, index) {
                final role = roleColors.keys.elementAt(index);
                final color = roleColors[role]!;
                return Role(
                  color: color,
                  role: role,
                  user:user,
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showRoleSelectionDialog(context, user),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: padding4 * 3,
          vertical: padding4,
        ),
        decoration: BoxDecoration(
          color: getRoleColor(user.role),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          user.role?.capitalize() ?? "No role",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
