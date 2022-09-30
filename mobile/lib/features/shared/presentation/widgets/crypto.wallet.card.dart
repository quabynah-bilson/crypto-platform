import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

/// wallet card UI
class CryptoWalletCard extends StatelessWidget {
  const CryptoWalletCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimationLimiter(
        child: GestureDetector(
          // todo => show card details
          onTap: () => context.showCustomDialog(
              headerIconAsset: kAppLogo, message: kFeatureUnderDev),
          child: Stack(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 350),
              childAnimationBuilder: (child) => SlideAnimation(
                  verticalOffset: 50, child: FadeInAnimation(child: child)),
              children: [
                /// wallet background
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  width: context.width,
                  decoration: BoxDecoration(
                    color:
                        context.colorScheme.secondary.withOpacity(kEmphasisLow),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),

                /// wallet foreground
                Container(
                  height: context.height * 0.3,
                  margin: const EdgeInsets.only(top: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  width: context.width,
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// top section
                      AnimatedRow(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// logo
                          kAppLogo.asAssetImage(size: 48),

                          /// balance & change
                          AnimatedColumn(
                            animateType: AnimateType.slideUp,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              '149,128.98'.h5(context,
                                  color: context.colorScheme.onSecondary),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  '\$129.23'.subtitle2(context,
                                      color: context.colorScheme.onSecondary),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 4),
                                    margin: const EdgeInsets.only(left: 12),
                                    decoration: BoxDecoration(
                                      color: context.colorScheme.onSecondary,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: '+2.3%'.subtitle2(context,
                                        color: context.colorScheme.secondary),
                                  ),
                                ],
                              ).top(8),
                            ],
                          ),
                        ],
                      ),

                      /// bottom section
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// todo => replace with user details
                          Expanded(
                            child: AnimatedRow(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Samples.kSampleUserAvatar
                                    .avatar(size: 40, circular: true)
                                    .right(12),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    'Dennis Bilson'.h6(context,
                                        color: context.colorScheme.onSecondary,
                                        weight: FontWeight.bold),
                                    '127* **** **23'.subtitle2(context,
                                        color: context.colorScheme.onSecondary,
                                        emphasis: kEmphasisMedium),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: context.colorScheme.onSecondary,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            // todo => show wallet details
                            child: Icon(Icons.arrow_right_alt,
                                color: context.colorScheme.secondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).fillMaxHeight(context, 0.3),
        ),
      );
}
