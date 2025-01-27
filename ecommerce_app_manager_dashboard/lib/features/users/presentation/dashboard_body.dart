import 'package:ecommerce_app_manager_dashboard/features/users/presentation/update_role_cubit/update_user_role_cubit.dart';
import 'package:ecommerce_app_manager_dashboard/features/users/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants/app_numbers.dart';
import 'cubit/get_users_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App users'),
        elevation: 2,
      ),
      body: BlocListener<UpdateUserRoleCubit, UsersState>(
        listener: (context, state) {
          if (state is UpdateUserRoleSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is UpdateUserRoleFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMsg),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocConsumer<GetUsersCubit, UsersState>(
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
                padding: const EdgeInsets.all(padding4 * 4),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserCard(user: user);
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
      ),
    );
  }
}
