import 'dart:io';
import 'package:ecommerce_store_dashboard/features/auth/presentation/complete_profile_screen/widgets/complete_your_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/helper/app_functions.dart';
import '../../../../core/utils/constants/app_numbers.dart';
import '../cubit/user_cubit.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.signUp,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: padding4 * 5),
          child: Column(
            children: [
              const SizedBox(height: padding4 * 12),
              Text(
                AppLocalizations.of(context)!.completeProfile,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                AppLocalizations.of(context)!.completeYourProfileDetails,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: padding4 * 12),
              const ProfileImage(),
              const SizedBox(height: padding4 * 12),
              const CompleteYourProfileForm()
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(100),
          ),
          child: GestureDetector(
            onTap: () {
              pickImage().then((value) {
                if (context.mounted) {
                  return context.read<UserCubit>().uploadProfilePic(value);
                }
              });
            },
            child: Stack(
              children: [
                context.read<UserCubit>().profilePic != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(
                          File(
                            context.read<UserCubit>().profilePic!.path,
                          ),
                        ),
                        radius: 100,
                      )
                    : const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/images.png"),
                        radius: 100,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
