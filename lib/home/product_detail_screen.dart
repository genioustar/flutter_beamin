import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 상세'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 320,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.8),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 16,
                            ),
                            child: const Text(
                              '할인중',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '패캠 플러터',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                            PopupMenuButton(
                              icon: const Icon(Icons.more_vert),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    child: const Text('리뷰등록'),
                                    onTap: () {
                                      int reviewScore = 0;
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          TextEditingController
                                              reviewController =
                                              TextEditingController();
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return AlertDialog(
                                              title: const Text('리뷰등록'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller:
                                                        reviewController,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: '리뷰내용',
                                                    ),
                                                  ),
                                                  Row(
                                                    children: List.generate(
                                                      5,
                                                      (index) => IconButton(
                                                        onPressed: () {
                                                          setState(() =>
                                                              reviewScore =
                                                                  index);
                                                        },
                                                        icon: Icon(
                                                          Icons.star,
                                                          color: index <=
                                                                  reviewScore
                                                              ? Colors.amber
                                                              : Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text('취소'),
                                                ),
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text('등록'),
                                                ),
                                              ],
                                            );
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ];
                              },
                            ),
                          ],
                        ),
                        const Text('제품 상세 정보'),
                        const Text('상세정보'),
                        const Row(
                          children: [
                            Text(
                              '1000000원',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text('4.5'),
                          ],
                        )
                      ],
                    ),
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(text: '제품상세'),
                            Tab(text: '리뷰'),
                          ],
                        ),
                        SizedBox(
                          height: 500,
                          child: TabBarView(
                            children: [
                              Container(
                                child: const Text('제품 상세'),
                              ),
                              Container(
                                child: const Text('리뷰'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 72,
              color: Colors.deepPurple.withOpacity(0.8),
              child: const Center(
                child: Text(
                  '장바구니에 담기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
