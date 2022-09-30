import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/features/shared/presentation/manager/crypto_cubit.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var _loading = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener(
          bloc: context.read<CryptoCubit>(),
          listener: (context, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is ErrorState<String>) {
              context.showCustomDialog(
                  headerIconAsset: kAppLogo, message: state.failure);
            }

            // todo => handle success states
            if (state is SuccessState) {
              logger.i('success state => ${state.data}');
            }
          },
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverSafeArea(
              sliver: SliverToBoxAdapter(
                child: AnimatedRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// logo
                    Lottie.asset(
                      kLoadingAnim,
                      height: 56,
                      width: 56,
                      repeat: false,
                    ),

                    /// user details
                    AnimatedColumn(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        kAppName.subtitle1(context,
                            color: context.colorScheme.secondary,
                            weight: FontWeight.w600),
                        'Hi, Quabynah Jr. 👋🏽'.bodyText1(context),
                      ],
                    ),

                    /// action buttons
                    IconButton(
                      onPressed: () => context.showCustomDialog(
                          headerIconAsset: kAppLogo, message: kFeatureUnderDev),
                      icon: const Icon(Icons.face),
                    ),
                  ],
                ).horizontal(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
