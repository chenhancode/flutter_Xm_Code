import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductContentController extends GetxController {
  //TODO: Implement ProductContentController
  final ScrollController scrollController = ScrollController();

  RxDouble opcity = 0.0.obs;

  List tabsList = [
    {
      "id": 1,
      "title": "商品",
    },
    {
      "id": 2,
      "title": "详情",
    },
    {
      "id": 3,
      "title": "推荐",
    },
  ];

  RxInt selectTabsList = 1.obs;

  RxBool showTabs = false.obs;

  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels <= 100) {
        opcity.value = scrollController.position.pixels / 100;
        if(showTabs.value==true){
          showTabs.value = false;
        }
        update();
      }else{
        if(showTabs.value==false){
          showTabs.value = true;
        }
        update();
      }
    });
  }

  changeTabsIndex(id){
    selectTabsList.value = id;
  }

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
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
