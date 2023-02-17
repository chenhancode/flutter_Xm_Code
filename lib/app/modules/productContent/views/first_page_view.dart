import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //引入宽高
import 'package:get/get.dart';
import '../controllers/product_content_controller.dart';

class FirstPageView extends GetView {
  @override
  final ProductContentController controller = Get.find();

  FirstPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      key: controller.gk1,
      width: 1080.w,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
              'https://www.itying.com/images/flutter/p1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.h),
            child: Text(
              '联想ThinkPad 翼480 (0vcd) 因特尔酷睿i5联想ThinkPad 翼480 (0vcd) 因特尔酷睿i5联想ThinkPad 翼480 (0vcd) 因特尔酷睿i5',
              style: TextStyle(color: Colors.black87, fontSize: 46.sp),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.h),
            child: Text(
              '震撼首发，15.9毫米全金属外观，4.9毫米轻薄窄边框，指纹解锁震撼首发，15.9毫米全金属外观，4.9毫米轻薄窄边框，指纹解锁',
              style: TextStyle(color: Colors.black87, fontSize: 34.sp),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '价格：',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '￥128',
                      style: TextStyle(color: Colors.red, fontSize: 56.sp),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '原价：',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '￥166',
                      style: TextStyle(color: Colors.black26, fontSize: 46.sp),
                    )
                  ],
                ),
              ],
            ),
          ),
          //   筛选
          Container(
              height: 100.h,
              child: GestureDetector(
                onTap: () {
                  Get.bottomSheet(Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20.w),
                    width: double.infinity,
                    height: 1200.h,
                    child: ListView(
                      children: [
                        Wrap(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20.h, left: 20.w),
                              width: 1040.w,
                              child: Text(
                                '版本',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 1040.w,
                              padding: EdgeInsets.only(top: 20.h, left: 20.w),
                              child: Wrap(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(20.w),
                                    child: Chip(label: Text('8Gb+128Gb')),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20.w),
                                    child: Chip(label: Text('8Gb+128Gb')),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20.w),
                                    child: Chip(label: Text('8Gb+128Gb')),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20.w),
                                    child: Chip(label: Text('8Gb+128Gb')),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '已选',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text('115,黑色，1件'),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black38,
                      size: 46.sp,
                    ),
                  ],
                ),
              )),
          Container(
            height: 100.h,
            child: GestureDetector(
              onTap: () {
                Get.bottomSheet(Container(
                  width: double.infinity,
                  height: 1200.h,
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Text("""
                        哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈
                        哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈
                        哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈
                        哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈
                        """),
                    ],
                  ),
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '门店',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text('万达门店'),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black38,
                    size: 46.sp,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100.h,
            child: InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  padding: EdgeInsets.all(20.w),
                  height: 1000.h,
                  width: double.infinity,
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Text("""
                        哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈
                        哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈
                        哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈
                        哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈
                        """),
                    ],
                  ),
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '服务 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Image.asset('assets/images/service.png'),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black38,
                    size: 46.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
