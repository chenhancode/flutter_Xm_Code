import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/home_rxzx_model.dart';
import '../../../services/httpsClient.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController
  ScrollController scrollController = ScrollController();
  RxList<RxzxResult> splbList = <RxzxResult>[].obs;
  RxInt page = 1.obs;
  int pageSize = 8;
  bool flag = true;
  RxBool hasData = true.obs;
  GlobalKey<ScaffoldState> scaglobalKey = GlobalKey<ScaffoldState>();
  String sort = '';
  RxInt subHeaderListSort = 0.obs;
  List subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort":
          -1, // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];
  RxInt selectHeaderId = 1.obs;
  HttpsClient httpsClient = HttpsClient();

  void subHeaderChange(id) {
    if (id == 4) {
      selectHeaderId.value = id;
      scaglobalKey.currentState!.openEndDrawer();
    } else {
      selectHeaderId.value = id;
      subHeaderListSort.value = subHeaderList[id - 1]['sort'];
      //改变排序
      sort =
          "${subHeaderList[id - 1]['fileds']}_${subHeaderList[id - 1]['sort']}";
      subHeaderList[id - 1]['sort'] = subHeaderList[id - 1]['sort'] * -1;
      //重新请求接口
      page.value = 1;
      splbList.value = [];
      hasData.value = true;
      flag = true;
      scrollController.jumpTo(0);
      getsplbList();
    }
  }

  void initsScrollController() {
    scrollController.addListener(() {
      // scrollController.position.pixels 滚动条下拉高度
      // scrollController.position.maxScrollExtent 页面高度
      if (scrollController.position.pixels >
          (scrollController.position.maxScrollExtent - 20)) {
        getsplbList();
      }
    });
  }

  void getsplbList() async {
    if (flag && hasData.value) {
      flag = false;
      var re = await httpsClient.get(
          'api/plist?cid=${Get.arguments['cid']}&page=${page.value}&pageSize=$pageSize&sort=$sort');
      if (re != null) {
        var gtl = HomeRxzx.fromJson(re.data);
        // 拼接数据
        splbList.addAll(gtl.result!);
        page.value++;
        // update();
        flag = true;
        if (gtl.result!.length < pageSize) {
          hasData.value = false;
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    getsplbList();
    initsScrollController();
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
