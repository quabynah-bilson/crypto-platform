import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/features/shared/presentation/manager/crypto_cubit.dart';
import 'package:mobile/features/shared/presentation/widgets/crypto.wallet.card.dart';
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
    kUseDefaultOverlays(context,
        statusBarBrightness: context.invertedThemeBrightness);

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
          // physics: const NeverScrollableScrollPhysics(),
          slivers: [
            /// header bar (logo, title, user profile image)
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(color: context.colorScheme.primary),
                child: SafeArea(
                  bottom: false,
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

                      /// title
                      kAppName.subtitle1(context,
                          color: context.colorScheme.onPrimary,
                          weight: FontWeight.w600),

                      /// user profile
                      IconButton(
                        onPressed: () => context.showCustomDialog(
                            headerIconAsset: kAppLogo,
                            message: kFeatureUnderDev),
                        icon: ClipOval(
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: context.colorScheme.onPrimary,
                                  width: 2.5),
                            ),
                            // todo => replace with user profile image
                            child: Samples.kSampleUserAvatar.avatar(
                              size: 56,
                              circular: true,
                            ),
                          ),
                        ),
                        iconSize: 48,
                      ),
                    ],
                  ).horizontal(16),
                ),
              ),
            ),

            /// wallet balance
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
              sliver: SliverToBoxAdapter(child: CryptoWalletCard()),
            ),

            /// actions
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildActionButton('Send', FeatherIcons.send),
                  _buildActionButton(
                      'Receive', FeatherIconsSnakeCase.phone_incoming),
                  _buildActionButton('Swap', Icons.swap_calls),
                  _buildActionButton('Buy', FontAwesome5.wallet),
                ],
              ),
            ),

            /// recent transactions
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverFillRemaining(
                child: Container(
                  // todo => build recent transactions
                  color: context.colorScheme.background,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// build action button
  Widget _buildActionButton(String title, IconData icon,
          [void Function()? onTap]) =>
      GestureDetector(
        onTap: onTap ??
            () => context.showCustomDialog(
                headerIconAsset: kAppLogo, message: kFeatureUnderDev),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: kToolbarHeight,
              width: kToolbarHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                border:
                    Border.all(color: context.theme.disabledColor, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: context.colorScheme.primary),
            ),
            title.button(context).top(8),
          ],
        ),
      );
}
