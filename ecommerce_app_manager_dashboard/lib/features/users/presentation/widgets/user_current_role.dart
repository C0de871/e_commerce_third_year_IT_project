import 'package:ecommerce_app_manager_dashboard/core/utils/constants/app_numbers.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/domain/entities/get_users_entity/data_entity.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/cubit/get_users_cubit.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/update_role_cubit/update_user_role_cubit.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/widgets/role.dart';
import 'package:ecommerce_app_manager_dashboard/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void _showRoleSelectionDialog(BuildContext parentContext, DataEntity user) {
    final updateUserRole = parentContext.read<UpdateUserRoleCubit>();
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: updateUserRole,
          child: AlertDialog(
            scrollable: false,
            title: const Text('Select Role'),
            content: SizedBox(
              width: double.minPositive,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: Stack(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: roleColors.length,
                      itemBuilder: (context, index) {
                        final role = roleColors.keys.elementAt(index);
                        final color = roleColors[role]!;
                        return Role(
                          color: color,
                          role: role,
                          user: user,
                          parentContext: parentContext,
                        );
                      },
                    ),
                    BlocBuilder<UpdateUserRoleCubit, UsersState>(
                      builder: (context, state) {
                        if (state is UpdateUserRoleLoading) {
                          return const Center(
                            child: Visibility(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
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
