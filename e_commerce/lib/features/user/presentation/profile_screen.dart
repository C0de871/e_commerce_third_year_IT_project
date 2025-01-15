import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/auth/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/auth/presentation/cubit/get_last_user_cubit/get_last_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity? user;
    if (context.read<GetLastUserCubit>().state is UserLoaded) {
      user = (context.read<GetLastUserCubit>().state as UserLoaded).user;
    }
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Text(
          "Profile",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: padding4 * 4,
          vertical: padding4 * 4,
        ),
        width: double.infinity,
        child: user == null
            ? Text("Failed")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (user.subUserEntity!.imageUrl == null)
                          ? Hero(
                              tag: "placeHolder picture",
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/images.png"),
                                radius: 100,
                              ),
                            )
                          : Hero(
                              tag: "profile picture",
                              child: CircleAvatar(
                                radius: 40,
                                foregroundImage: CachedNetworkImageProvider(
                                  user.subUserEntity!.imageUrl!,
                                ),
                              ),
                            ),
                      SizedBox(
                        width: padding4 * 4,
                      ),
                      Hero(
                        tag: "profile name",
                        child: Text(
                          "${user.subUserEntity!.firstName} ${user.subUserEntity!.lastName}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                  // (user.subUserEntity!.imageUrl == null)
                  //     ? Hero(
                  //         tag: "profile image",
                  //         child: const CircleAvatar(
                  //           backgroundImage: AssetImage("assets/images/images.png"),
                  //           radius: 100,
                  //         ),
                  //       )
                  //     : Hero(
                  //         tag: "profile image",
                  //         child: CircleAvatar(
                  //           radius: 100,
                  //           foregroundImage: CachedNetworkImageProvider(
                  //             user.subUserEntity!.imageUrl!,
                  //           ),
                  //         ),
                  //       ),
                  // SizedBox(
                  //   height: padding4 * 5,
                  // ),
                  Column(
                    children: [
                      SizedBox(
                        height: padding4 * 5,
                      ),
                      SizedBox(
                        height: 220,
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card1(
                                    title: "Account",
                                    description: "View Your Profile",
                                    icon: Icons.person,
                                    forgroundGroundColor:
                                        AppColors.cardFGLightYellow,
                                    backGroundColor:
                                        AppColors.cardBGLightYellow,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.accountDetails,
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: padding4 * 2,
                                  ),
                                  Card1(
                                    title: "Favorites",
                                    description: "My favorites",
                                    icon: Icons.favorite,
                                    backGroundColor: AppColors.cardBGLightPink,
                                    forgroundGroundColor:
                                        AppColors.cardFGLightPink,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.favoritesRoute,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: padding4 * 2,
                            ),
                            Expanded(
                              child: Card1(
                                title: "Orders",
                                description: "MY orders",
                                icon: Icons.restaurant,
                                backGroundColor: AppColors.cardBGLightPurple,
                                forgroundGroundColor:
                                    AppColors.cardFGLightPurple,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: padding4 * 2,
                      ),
                      Card1(
                        title: "Notification",
                        description: "View Your Notification",
                        icon: Icons.notifications,
                        backGroundColor: AppColors.cardBGLightBlue,
                        forgroundGroundColor: AppColors.cardFGLightBlue,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  const Card1({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.backGroundColor,
    required this.forgroundGroundColor,
    required this.onTap,
    this.width,
    this.height,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color backGroundColor;
  final Color forgroundGroundColor;
  final double? width;
  final double? height;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.gradientLightGrey,
              blurRadius: 14,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(
            padding4 * 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardTitle(
                  backGroundColor: backGroundColor,
                  icon: icon,
                  forgroundGroundColor: forgroundGroundColor,
                  title: title),
              SizedBox(
                height: padding4 * 2,
              ),
              CardDescription(description: description),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDescription extends StatelessWidget {
  const CardDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          description,
          style: TextStyle(
            color: AppColors.myOnSurface,
          ),
        ),
        SizedBox(
          width: padding4,
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.myOnSurface,
        ),
      ],
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle({
    super.key,
    required this.backGroundColor,
    required this.icon,
    required this.forgroundGroundColor,
    required this.title,
  });

  final Color backGroundColor;
  final IconData icon;
  final Color forgroundGroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        padding4 * 2,
      ),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: forgroundGroundColor,
          ),
          SizedBox(width: padding4),
          Text(
            title,
            style: TextStyle(
              color: forgroundGroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
