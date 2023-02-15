import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductContentController extends GetxController {
  //TODO: Implement ProductContentController
  final ScrollController scrollController = ScrollController();

  RxDouble opcity = 0.0.obs;

  scrollControllerListener(){
    scrollController.addListener(() {
      if(scrollController.position.pixels <= 100){
        opcity.value =scrollController.position.pixels/100;
        update();
      }
    });
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
