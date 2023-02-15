import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xiaomishop/app/services/httpsClient.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);

  Widget _productList() {
    return Obx(
      () => controller.splbList.isNotEmpty
          ? ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.fromLTRB(26.h, 130.h, 26.h, 26.h),
              itemCount: controller.splbList.length,
              itemBuilder: (content, index) {
                return Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(bottom: 26.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.w)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(60.w),
                            width: 400.w,
                            height: 460.h,
                            child: Image.network(
                              HttpsClient.replaeUri(
                                  controller.splbList[index].sPic),
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
                                    '${controller.splbList[index].title}',
                                    style: TextStyle(
                                      fontSize: 42.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: Text(
                                    '${controller.splbList[index].subTitle}',
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
                                  '${controller.splbList[index].price}',
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
                    ),
                    (index == controller.splbList.length - 1)
                        ? _progressIndicator()
                        : const Text(''),
                  ],
                );
              },
            )
          : _progressIndicator(),
    );
  }

  Widget _subHeaderList() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Obx(
        () => Container(
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
            children: controller.subHeaderList.map((value) {
              return Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.subHeaderChange(value['id']);
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
                        child: Text(
                          "${value['title']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.selectHeaderId == value['id']
                                ? Colors.red
                                : Colors.black,
                            fontSize: 32.sp,
                          ),
                        ),
                      ),
                    ),
                    _showIcon(value['id']),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _progressIndicator() {
    if (controller.hasData.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Center(
        child: Text('没有数据啦，我是有底线的'),
      );
    }
  }

  Widget _showIcon(id) {
    if (id == 2 ||
        id == 3 ||
        controller.subHeaderListSort.value == 1 ||
        controller.subHeaderListSort.value == -1) {
      if (controller.subHeaderList[id - 1]['sort'] == 1) {
        return const Icon(
          Icons.arrow_drop_down,
          color: Colors.black54,
        );
      } else {
        return const Icon(
          Icons.arrow_drop_up,
          color: Colors.black54,
        );
      }
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaglobalKey,
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      endDrawer: const Drawer(
        child: DrawerHeader(
          child: Text("右侧筛选"),
        ),
      ),
      appBar: AppBar(
        actions: const [
          Text(''),
        ],
        title: Container(
          width: 910.w,
          height: 96.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            onTap: (){
              Get.offAndToNamed('/search');
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 4, 0),
                  child: Icon(Icons.search),
                ),
                Text(
                  controller.Keywords != null ? "${controller.Keywords}" : "",
                  style: TextStyle(fontSize: 32.sp, color: Colors.black45),
                ),
              ],
            ),
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
