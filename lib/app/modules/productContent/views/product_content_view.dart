import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductContentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductContentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
