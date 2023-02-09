import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_list_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);

  Widget _productList() {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(26.h, 130.h, 26.h, 26.h),
      itemCount: 10,
      itemBuilder: (content, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 26.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.w)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(60.w),
                width: 400.w,
                height: 460.h,
                child: Image.network(
                  'https://xiaomi.itying.com/public/upload/iFrB4izNiGzov22F2aJXX0ta.png_200x200.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Text(
                        'Redmi Note 11',
                        style: TextStyle(
                          fontSize: 42.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Text(
                        '内外双旗舰屏幕 | 徕卡专业光学镜头 | 徕卡原生双画质',
                        style: TextStyle(
                          fontSize: 34.sp,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'CPU',
                                  style: TextStyle(
                                    fontSize: 34.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Helio G25',
                                  style: TextStyle(
                                    fontSize: 34.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'CPU',
                                  style: TextStyle(
                                    fontSize: 34.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Helio G25',
                                  style: TextStyle(
                                    fontSize: 34.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'CPU',
                                  style: TextStyle(
                                    fontSize: 34.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Helio G25',
                                  style: TextStyle(
                                    fontSize: 34.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '￥8889元',
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _subHeaderList() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: 120.h,
        width: 1080.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 2.h,
              color: const Color.fromRGBO(233, 233, 233, 0.9),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                  child: Text(
                    "综合",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 32.sp,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                  child: Text(
                    "销量",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.sp,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                  child: Text(
                    "价格",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.sp,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                  child: Text(
                    "筛选",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: Container(
          width: 910.w,
          height: 96.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 4, 0),
                child: Icon(Icons.search),
              ),
              Text(
                '手机',
                style: TextStyle(fontSize: 32.sp, color: Colors.black45),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(children: [
        _productList(),
        _subHeaderList(),
      ]),
    );
  }
}
