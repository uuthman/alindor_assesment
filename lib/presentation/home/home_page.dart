import 'package:alindor_assessment/app/di.dart';
import 'package:alindor_assessment/presentation/recorder/recorder_page.dart';
import 'package:alindor_assessment/presentation/records/records_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  PageController? pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentIndex == 0
          ? $color.recorderBackground
          : $color.recordsBackground,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: const [
                RecorderPage(),
                RecordsPage(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: $padding.p24, right: $padding.p16, left: $padding.p16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        2,
                        (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              margin: EdgeInsets.only(right: $padding.p6),
                              height: 6,
                              width:
                                  _currentIndex == index ? $size.s20 : $size.s6,
                              decoration: BoxDecoration(
                                  color: _currentIndex == index
                                      ? Colors.green
                                      : Colors.black,
                                  borderRadius:
                                      BorderRadius.circular($size.s3)),
                            )),
                  ),
                  const SizedBox.shrink(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
