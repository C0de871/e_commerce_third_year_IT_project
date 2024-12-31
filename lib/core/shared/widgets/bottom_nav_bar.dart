import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/features/home/presentation/Navigation%20cubit/navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../utils/constants/app_numbers.dart';
import '../rive_model/menu.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<SMIBool> riveIconInput = [];
  List<StateMachineController?> controllers = [];

  @override
  void dispose() {
    for (var controller in controllers) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void animateIcon(int index) {
    riveIconInput[index].change(true);
    Future.delayed(Duration(seconds: 1), () {
      riveIconInput[index].change(false);
    });
  }

  void riveOnInit(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      stateMachineName,
    );
    artboard.addController(controller!);
    controllers.add(controller);
    riveIconInput.add(controller.findInput<bool>("active") as SMIBool);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      child: Container(
        padding: const EdgeInsets.all(padding4 * 3),
        margin: const EdgeInsets.only(
          left: padding4 * 6,
          right: padding4 * 6,
          bottom: padding4 * 4,
        ),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.inversePrimary,
          // color: const Color.fromARGB(255, 243, 209, 177),
          color: AppColors.bottomNavBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: AppColors.bottomNavBgColor.withOpacity(0.3),
              offset: Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavItems.length,
            (index) {
              final riveIcon = bottomNavItems[index].rive;
              return BlocBuilder<NavigationBarCubit, int>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      animateIcon(index);
                      context.read<NavigationBarCubit>().choosePage(index);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                          isActive: state == index,
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: state == index ? 1 : 0.5,
                            child: RiveAnimation.asset(
                              riveIcon.src,
                              artboard: riveIcon.artboard,
                              onInit: (artboard) {
                                riveOnInit(
                                  artboard,
                                  stateMachineName: riveIcon.stateMachineName,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
        color: AppColors.bottomNavSelectedColor,
      ),
      duration: Duration(
        milliseconds: 200,
      ),
    );
  }
}
