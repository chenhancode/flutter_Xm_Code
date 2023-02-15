import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../services/searchServices.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

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
          child: TextField(
            onSubmitted: (value) {
              //保存搜索记录
              SearchServices.setHistoryData(value);
              Get.offAndToNamed('/product-list', arguments: {
                "Keywords": value,
              });
            },
            onChanged: (value) {
              controller.Keywords = value;
            },
            autofocus: true,
            style: TextStyle(
              fontSize: 36.sp,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              //保存搜索记录
              SearchServices.setHistoryData(controller.Keywords);

              //路由跳转
              Get.offAndToNamed('/product-list', arguments: {
                "Keywords": controller.Keywords,
              });
            },
            child: Text(
              '搜索',
              style: TextStyle(
                fontSize: 34.sp,
                color: Colors.black54,
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          Obx(() => controller.historyList.isNotEmpty? Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '搜索历史',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42.sp,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.bottomSheet(Container(
                        padding: EdgeInsets.all(20.w),
                        color: Colors.white,
                        width: 1080.w,
                        height: 360.h,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "您确定要清空历史记录吗",
                                  style: TextStyle(fontSize: 48.sp),
                                )
                              ],
                            ),
                            RSizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            209, 235, 235, 235),
                                      ),
                                      foregroundColor:  MaterialStateProperty.all(
                                          Colors.white),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("取消")),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            209, 235, 235, 235),
                                      ),
                                      foregroundColor:  MaterialStateProperty.all(
                                          Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.clearHistoryData();
                                      Get.back();
                                    },
                                    child: const Text("确定")),
                              ],
                            )
                          ],
                        ),
                      ));
                    },
                    icon: const Icon(Icons.delete_forever_outlined)),
              ],
            ),
          ):const Text(''),),
          Obx(
            () => Wrap(
              children: controller.historyList.map((value) {
                return GestureDetector(
                  onLongPress: (){
                    controller.removeHistoryData(value);
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(32.w, 16.w, 32.w, 16.w),
                    margin: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '猜你想搜',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42.sp,
                  ),
                ),
                const Icon(Icons.refresh),
              ],
            ),
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(32.w, 16.w, 32.w, 16.w),
                margin: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Text('手机'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(32.w, 16.w, 32.w, 16.w),
                margin: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Text('笔记本电脑'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(32.w, 16.w, 32.w, 16.w),
                margin: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Text('路由器'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
