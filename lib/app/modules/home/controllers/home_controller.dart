import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../models/xmmodel_model.dart';
import '../../../models/home_category_model.dart';
import '../../../models/home_rxzx_model.dart';
import '../../../services/httpsClient.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();
  RxList<Result> swiperList = <Result>[].obs;
  RxList<Result> bestSellingSwiperList = <Result>[].obs;
  RxList<RxzxResult> rxzxList = <RxzxResult>[].obs;
  RxList<RxzxResult> rmspList = <RxzxResult>[].obs;

  RxList<HomeCategoryResult> homeCategory = <HomeCategoryResult>[].obs;

  HttpsClient httpsClient = new HttpsClient();

  // 获取轮播图
  getFoucusData() async {
    var re = await httpsClient.get('api/focus');
    if (re != null) {
      var xm = Xmmodel.fromJson(re.data);
      swiperList.value = xm.result!;
      update();
    }
  }

  // 获取热销轮播图
  getBestSellingSwiperList() async {
    var re = await httpsClient.get('api/focus?position=2');
    if (re != null) {
      var xm = Xmmodel.fromJson(re.data);
      bestSellingSwiperList.value = xm.result!;
      update();
    }
  }

  // 获取热销内容区
  getRxzxList() async {
    var re = await httpsClient.get('api/plist?is_hot=1&pageSize=3');
    if (re != null) {
      var rx = HomeRxzx.fromJson(re.data);
      rxzxList.value = rx.result!;
      update();
    }
  }

  // 获取热门内容区
  getRmspList() async {
    var re = await httpsClient.get('api/plist?is_best=1');
    if (re != null) {
      var rm = HomeRxzx.fromJson(re.data);
      rmspList.value = rm.result!;
      update();
    }
  }

  getHomeCategoryData() async {
    var re = await httpsClient.get('api/bestCate');
    if (re != null) {
      var hc = HomeCategory.fromJson(re.data);
      homeCategory.value = hc.result!;
      update();
    }
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
    getBestSellingSwiperList();
    getRxzxList();
    getRmspList();
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
