import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/category_controller.dart';
import '../../../services/httpsClient.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  Widget _leftCategory() {
    return SizedBox(
      width: 280.w,
      height: double.infinity,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 180.h,
              child: Obx(() => InkWell(
                    onTap: () {
                      controller.changeSelectIndex(
                          index, controller.categoryList[index].sId as String);
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 10.w,
                            height: 46.h,
                            color: controller.selectIndex.value == index
                                ? Colors.orange
                                : Colors.white,
                          ),
                        ),
                        Center(
                          child: Text(
                            '${controller.categoryList[index].title}',
                            style: TextStyle(
                              fontSize: 36.sp,
                              fontWeight: controller.selectIndex.value == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }

  Widget _rightCategory() {
    return Expanded(
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Obx(
          () => GridView.builder(
            itemCount: controller.contentList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 40.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 240 / 340,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed('/product-list', arguments: {
                    "cid": controller.contentList[index].sId,
                  });
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Image.network(
                        HttpsClient.replaeUri(
                            controller.contentList[index].pic),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                      child: Text(
                        '${controller.contentList[index].title}',
                        style: TextStyle(fontSize: 32.sp),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 840.w,
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.black45,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Row(
        children: [
          _leftCategory(),
          _rightCategory(),
        ],
      ),
    );
  }
}
