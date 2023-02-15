import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //引入宽高
import 'package:get/get.dart';
import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //实现透明导航
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(96.h),
        child: Obx(
          () => AppBar(
            title: SizedBox(
              width: 400.w,
              height: 96.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '商品',
                          style: TextStyle(fontSize: 36.sp),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 100.w,
                          height: 4,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '商品',
                          style: TextStyle(fontSize: 36.sp),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 100.w,
                          height: 4,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '商品',
                          style: TextStyle(fontSize: 36.sp),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 100.w,
                          height: 4,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white.withOpacity(controller.opcity.value),
            elevation: 0,
            leading: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(const CircleBorder()),
              ),
              onPressed: () {},
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 10.w),
                width: 88.w,
                height: 88.w,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.file_upload_outlined,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.w),
                width: 88.w,
                height: 88.w,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.more_horiz_outlined,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        controller: controller.scrollController,
        children: [
          Container(
            width: 1080.w,
            height: 300.h,
            color: Colors.orange,
          ),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
          const ListTile(title: Text('我是一个列表')),
        ],
      ),
    );
  }
}
