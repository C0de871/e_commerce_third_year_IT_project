
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/get_users_entity/data_entity.dart';
import 'cubit/get_users_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        elevation: 2,
      ),
      body: BlocConsumer<GetUsersCubit, GetUsersState>(
        listener: (context, state) {
          if (state is GetUsersFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMsg)),
            );
          }
        },
        builder: (context, state) {
          if (state is GetUsersSuccess) {
            final users = state.usersList.data;
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.network(
                            user.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey[300],
                                child: const Icon(Icons.person, size: 40),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${user.firstName} ${user.lastName}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () => _showRoleSelectionDialog(context, user),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
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
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.email, size: 16),
                                  const SizedBox(width: 8),
                                  Text(user.email),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.phone, size: 16),
                                  const SizedBox(width: 8),
                                  Text(user.phoneNumber),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is GetUsersFailed) {
            return Center(
              child: Text(state.errMsg),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// Extension to capitalize strings
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}