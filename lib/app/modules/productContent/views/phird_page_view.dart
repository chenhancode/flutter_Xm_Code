import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //引入宽高
import 'package:get/get.dart';

import '../controllers/product_content_controller.dart';

class PhirdPageView extends GetView {
  @override
  final ProductContentController controller = Get.find();

  PhirdPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      width: 1080.w,
      height: 2800.h,
      alignment: Alignment.center,
      color: Colors.red,
      child: Text(
        '推荐',
        style: TextStyle(fontSize: 200.sp),
      ),
    );
  }
}
