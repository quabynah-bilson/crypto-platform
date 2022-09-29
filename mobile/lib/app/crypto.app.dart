import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/routing/route.gr.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

/// application instance
class CryptoMobileApp extends StatefulWidget {
  const CryptoMobileApp({Key? key}) : super(key: key);

  @override
  State<CryptoMobileApp> createState() => _CryptoMobileAppState();
}

class _CryptoMobileAppState extends State<CryptoMobileApp> {
  final _router = AppRouter(), _fonts = GoogleFonts.dmMonoTextTheme();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: kAppName,
        theme: kLightTheme(context: context).copyWith(textTheme: _fonts),
        darkTheme: kDarkTheme(context: context).copyWith(textTheme: _fonts),
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
      );
}
