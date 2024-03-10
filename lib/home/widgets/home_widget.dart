import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController pageController = PageController();
  int bannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.all(20),
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(
                  () {
                    bannerIndex = index;
                  },
                );
              },
              children: const [
                Image(image: AssetImage('assets/Fastcampus.png')),
                Image(image: AssetImage('assets/Fastcampus.png')),
              ],
            ),
          ),
          // PageView의 페이지 수에 따라 점이 생성됨
          DotsIndicator(
            dotsCount: 2,
            position: bannerIndex,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '카테고리',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('더보기'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                //TODO: 카테고리 목록을 받아오는 위젯 구현
                Container(
                  height: 240,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '오늘의 특가',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('더보기'))
                  ],
                ),
                Container(
                  height: 240,
                  color: Colors.orange,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
