import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/features/welcome/provider/welcome_notifier.dart';
import 'package:ulearning_app/features/welcome/view/widgets.dart';

// final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30.h),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // showing our three welcome pages
              PageView(
                onPageChanged: (value) {
                  ref.read(indexDotProvider.notifier).changeIndex(value);
                },
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  AppOnBoardingPage(
                    controller: _controller,
                    imagePath: ImageRes.reading,
                    title: 'First see Learning',
                    subtitle:
                        'Forget about of paper all knowledge in one learning',
                    index: 1,
                  ),
                  AppOnBoardingPage(
                    controller: _controller,
                    imagePath: ImageRes.man,
                    title: 'Connect with Everyone',
                    subtitle:
                        "Always keep in touch with your tutor and friends. "
                        "Let's get connected",
                    index: 2,
                  ),
                  AppOnBoardingPage(
                    controller: _controller,
                    imagePath: ImageRes.boy,
                    title: 'Always Facinated Learning',
                    subtitle:
                        "Alnywhere, anytime. The time is at your discretion. "
                        "So study wherever you can",
                    index: 3,
                  ),
                ],
              ),
              // for showing dots
              Positioned(
                bottom: 50.h,
                child: DotsIndicator(
                  position: index,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    activeColor: AppColors.primaryElement,
                    size: const Size.square(9.0),
                    activeSize: const Size(24.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
