import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import 'package:ulearning_app/features/home/view/widgets/home_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    _controller = PageController(
      initialPage: ref.watch(homeScreenBannerDotsProvider),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: homeAppBar(ref),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const HelloText(),
              const UserName(),
              SizedBox(height: 20.h),
              searchBar(),
              SizedBox(height: 20.h),
              HomeBanner(
                ref: ref,
                controller: _controller,
              ),
              const HomeMenuBar(),
              // CustomScrollView(
              //   physics: const ScrollPhysics(),
              //   shrinkWrap: true,
              //   slivers: [
              //     SliverPadding(
              //       padding: const EdgeInsets.all(20),
              //       sliver: SliverGrid.count(
              //         crossAxisCount: 2,
              //         children: [
              //           Text('Hello I love flutter'),
              //           Text('Hello I love flutter'),
              //           Text('Hello I love flutter'),
              //           Text('Hello I love flutter'),
              //           Text('Hello I love flutter'),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              const CourseItemGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
