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

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CryptoCubit()),
        ],
        child: MaterialApp.router(
          title: kAppName,
          theme: kLightTheme(context: context).copyWith(textTheme: _fonts),
          darkTheme: kDarkTheme(context: context).copyWith(textTheme: _fonts),
          routerDelegate: _router.delegate(),
          routeInformationParser: _router.defaultRouteParser(),
        ),
      );
}
