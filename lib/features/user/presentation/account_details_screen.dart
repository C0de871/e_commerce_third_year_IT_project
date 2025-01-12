import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/shared/widgets/my_place_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constants/app_numbers.dart';
import '../../auth/domain/entites/user_entities/user_entities.dart';
import '../../auth/presentation/cubit/get_last_user_cubit/get_last_user_cubit.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity? user;
    if (context.read<GetLastUserCubit>().state is UserLoaded) {
      user = (context.read<GetLastUserCubit>().state as UserLoaded).user;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: padding4 * 4,
            vertical: padding4 * 4,
          ),
          child: user == null
              ? Text("Failed")
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (user.subUserEntity!.imageUrl == null)
                        ? Hero(
                            tag: "placeHolder picture",
                            child: const CircleAvatar(
                              backgroundImage: AssetImage("assets/images/images.png"),
                              radius: 100,
                            ),
                          )
                        : Hero(
                            tag: "profile picture",
                            child: CircleAvatar(
                              radius: 100,
                              foregroundImage: CachedNetworkImageProvider(
                                user.subUserEntity!.imageUrl!,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: padding4 * 5,
                    ),
                    Column(
                      children: [
                        Hero(
                          tag: "profile name",
                          child: Text(
                            "${user.subUserEntity!.firstName} ${user.subUserEntity!.lastName}",
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: padding4 * 5,
                        ),
                        AccountDetailsCard(
                          title: "First Name",
                          description: user.subUserEntity!.firstName!,
                        ),
                        Divider(
                          height: 30,
                        ),
                        AccountDetailsCard(
                          title: "Last Name",
                          description: user.subUserEntity!.lastName!,
                        ),
                        Divider(
                          height: 30,
                        ),
                        AccountDetailsCard(
                          title: "Address",
                          description: user.subUserEntity!.location!,
                        ),
                        Divider(
                          height: 30,
                        ),
                        AccountDetailsCard(
                          title: "Phone Number",
                          description: user.subUserEntity!.phoneNumber!,
                        ),
                        Divider(
                          height: 30,
                        ),
                        AccountDetailsCard(
                          title: "Email",
                          description: user.subUserEntity!.email!,
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class AccountDetailsCard extends StatelessWidget {
  const AccountDetailsCard({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title:"),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
