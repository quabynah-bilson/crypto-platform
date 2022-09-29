import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnimatedColumn(
          children: [
            Lottie.asset(kLoadingAnim,
                height: context.height * 0.2,
                width: context.width,
                repeat: false),
            kAppName.h4(context),
            kAppDesc.subtitle2(context, alignment: TextAlign.center),
          ],
        ).horizontal(24).centered(),
      );
}
