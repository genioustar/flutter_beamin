import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastcam_flutter_beamin/model/product.dart';
import 'package:flutter/material.dart';

class SellerWidget extends StatefulWidget {
  const SellerWidget({super.key});

  @override
  State<SellerWidget> createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(
            controller: searchController,
            leading: const Icon(Icons.search),
            onChanged: (value) {
              setState(() {});
            },
            hintText: '상품명을 입력하세요',
          ),
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
            child: StreamBuilder(
              stream: streamProducts(searchController.text.trim()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data!.docs
                      .map((e) =>
                          Product.fromJson(e.data() as Map<String, dynamic>)
                              .copyWith(docId: e.id))
                      .toList();
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return GestureDetector(
                        onTap: () {
                          print(item.docId);
                        },
                        child: Container(
                          height: 120,
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(item.imageUrl ??
                                        'https://fastly.picsum.photos/id/307/200/300.jpg?hmac=35wY422fzycUwe-jX9k1JwdWurkBiowwCBswfyVXY4E'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.title ?? '제품명',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          PopupMenuButton(
                                            icon: const Icon(Icons.more_vert),
                                            itemBuilder: (context) => [
                                              const PopupMenuItem(
                                                  value: 'edit',
                                                  child: Text('리뷰')),
                                              PopupMenuItem(
                                                value: 'delete',
                                                child: const Text('삭제'),
                                                onTap: () {
                                                  FirebaseFirestore.instance
                                                      .collection('product')
                                                      .doc(item.docId)
                                                      .delete();
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text('${item.price} 원'),
                                      Text(switch (item.isDiscount) {
                                        true => '${item.discountRate}% 할인',
                                        false => '할인 없음',
                                        null => '할인 정보 없음',
                                      }),
                                      const Text('재고수량'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future addCategories(String category) async {
    await FirebaseFirestore.instance
        .collection('category')
        .add({'title': category});
  }

  Future<List<Product>> getProducts() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('product')
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => Product.fromJson(doc.data()..['docId'] = doc.id))
        .toList();
  }

  Stream<QuerySnapshot> streamProducts(String query) {
    return query.isNotEmpty
        ? FirebaseFirestore.instance
            .collection('product')
            .orderBy('title')
            .startAt([query]).endAt(['$query\uf8ff']).snapshots()
        : FirebaseFirestore.instance.collection('product').snapshots();
  }
}
