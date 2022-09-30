import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/routing/route.gr.dart';
import 'package:mobile/features/shared/presentation/manager/crypto_cubit.dart';
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
  late final _lightTheme =
          kLightTheme(context: context).copyWith(textTheme: _fonts),
      _darkTheme = kDarkTheme(context: context).copyWith(textTheme: _fonts);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CryptoCubit()),
        ],
        child: MaterialApp.router(
          title: kAppName,
          theme: _lightTheme.copyWith(
            colorScheme: _lightTheme.colorScheme.copyWith(
              secondary: Colors.amber,
              onSecondary: const Color(0xff463002),
            ),
          ),
          darkTheme: _darkTheme,
          routerDelegate: _router.delegate(),
          routeInformationParser: _router.defaultRouteParser(),
        ),
      );
}
