import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastcam_flutter_beamin/model/category.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isSale = false;

  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  Uint8List? imageData;
  XFile? imageFile;

  Category? selectedCategory;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _salePercentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 추가'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.batch_prediction_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  imageFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  imageData = await imageFile?.readAsBytes();
                  setState(() {});
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: imageData == null
                      ? Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 240,
                              width: 240,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 1,
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  Text('이미지를 선택해주세요'),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Image.memory(
                          imageData!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  '기본정보',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: '상품명',
                        hintText: '상품명을 입력해주세요',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '상품명은 필수 입력 항목 입니다.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '상품 설명',
                        hintText: '상품 설명을 입력해주세요',
                      ),
                      maxLength: 254,
                      maxLines: null, // 여러줄 입력가능하게
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '상품 설명은 필수 입력 항목 입니다.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '가격(단가)',
                        hintText: '1개 가격을 입력해주세요',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '가격은 필수 입력 항목 입니다.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _stockController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '수량',
                        hintText: '입고 및 재고 수량',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '재고는 필수 입력 항목 입니다.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SwitchListTile(
                      value: isSale,
                      onChanged: (v) {
                        setState(() {
                          isSale = v;
                        });
                      },
                      title: const Text('할인여부'),
                    ),
                    if (isSale)
                      TextFormField(
                        controller: _salePercentController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '할인율',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return null;
                        },
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      '카테고리 선택',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    DropdownButton(
                      items: const [],
                      onChanged: (s) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
