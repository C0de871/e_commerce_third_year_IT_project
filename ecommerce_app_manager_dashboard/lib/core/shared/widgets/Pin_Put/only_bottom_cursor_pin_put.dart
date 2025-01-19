import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../features/auth/presentation/cubit/user_cubit.dart';

//onlyBottomCursor :
class OnlyBottomCursor extends StatefulWidget {
  const OnlyBottomCursor({super.key});

  @override
  State<OnlyBottomCursor> createState() => _OnlyBottomCursorState();

  @override
  String toStringShort() => 'With Bottom Cursor';
}

class _OnlyBottomCursorState extends State<OnlyBottomCursor> {
  //todo VerificationCodeController verificationCodeController = Get.put(VerificationCodeController(), permanent: false);

  final focusNode = FocusNode();

  @override
  void dispose() {
    // controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// const borderColor = Color.fromRGBO(114, 178, 238, 1);
//     const errorColor = Color.fromRGBO(255, 234, 238, 1);
    final submittedTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(155, 255, 117, 67),
        // color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: const BoxDecoration(),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            // color: Colors.white,
            // color: const Color.fromRGBO(222, 231, 240, .57),
            color: const Color.fromARGB(26, 255, 117, 67),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    return Pinput(
      onCompleted: (value) {
        // log(ver.text);
      },
      autofocus: true,
      length: 6,
      pinAnimationType: PinAnimationType.slide,
      controller: context.read<UserCubit>().otpController,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      showCursor: true,
      cursor: cursor,
      preFilledWidget: preFilledWidget,
      submittedPinTheme: submittedTheme,
    );
  }
}
