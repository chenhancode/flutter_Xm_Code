import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../models/xmmodel_model.dart';
import '../../../models/home_category_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();
  RxList<Result> swiperList = <Result>[].obs;
  RxList<HomeCategoryResult> homeCategory = <HomeCategoryResult>[].obs;

  // 获取轮播图
  getFoucusData() async {
    var re = await Dio().get('https://xiaomi.itying.com/api/focus');
    var xm = Xmmodel.fromJson(re.data);
    swiperList.value = xm.result!;
    update();
  }

  getHomeCategoryData() async {
    var re = await Dio().get('https://xiaomi.itying.com/api/bestCate');
    var hc = HomeCategory.fromJson(re.data);
    homeCategory.value = hc.result!;
    update();
  }

  // 判断首页下拉距离
  scrollList() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10) {
        if (flag.value == false) {
          flag.value = true;
          update();
        }
      }
      if (scrollController.position.pixels < 10) {
        if (flag.value == true) {
          flag.value = false;
          update();
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    getFoucusData();
    scrollList();
    getHomeCategoryData();
    // formatJson();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
