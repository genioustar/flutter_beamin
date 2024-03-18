import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerWidget extends StatefulWidget {
  const SellerWidget({super.key});

  @override
  State<SellerWidget> createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  Future addCategories(String category) async {
    await FirebaseFirestore.instance
        .collection('category')
        .add({'title': category});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBar(),
          const SizedBox(height: 16),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('카테고리 일괄 등록'),
              ),
              ElevatedButton(
                onPressed: () {
                  TextEditingController categoryController =
                      TextEditingController();
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: TextField(
                        controller: categoryController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '카테고리명',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            if (categoryController.text.isNotEmpty) {
                              await addCategories(
                                  categoryController.text.trim());
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: const Text('등록'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('카테고리 등록'),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              '상품목록',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '제품명',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  PopupMenuButton(
                                    icon: const Icon(Icons.more_vert),
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                          value: 'edit', child: Text('리뷰')),
                                      const PopupMenuItem(
                                          value: 'delete', child: Text('삭제')),
                                    ],
                                  ),
                                ],
                              ),
                              const Text('1000000'),
                              const Text('할인 중'),
                              const Text('재고수량'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
