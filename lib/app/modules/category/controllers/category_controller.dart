import 'package:get/get.dart';
import '../../../models/home_category_model.dart';
import 'package:dio/dio.dart';
import '../../../services/httpsClient.dart';

class CategoryController extends GetxController {
  // ignore: todo
  //TODO: Implement CategoryController
  // 选择分类
  RxInt selectIndex = 0.obs;

  // 获取分类
  RxList<HomeCategoryResult> categoryList = <HomeCategoryResult>[].obs;
  RxList<HomeCategoryResult> contentList = <HomeCategoryResult>[].obs;
  HttpsClient httpsClient = new HttpsClient();
  getCategoryList() async {
    var re = await httpsClient.get('api/pcate');
    if (re != null) {
      var gtl = HomeCategory.fromJson(re.data);
      categoryList.value = gtl.result!;
      getContentList(categoryList[0].sId!);
      update();
    }
  }

  getContentList(String id) async {
    var re = await httpsClient.get('api/pcate?pid=$id');
    if (re != null) {
      var gtl = HomeCategory.fromJson(re.data);
      contentList.value = gtl.result!;
      update();
    }
  }

  @override
  void onInit() {
    HttpsClient httpsClient1 = HttpsClient();
    HttpsClient httpsClient2 = HttpsClient();

    super.onInit();
    getCategoryList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeSelectIndex(index, String id) {
    selectIndex.value = index;
    getContentList(id);
    update();
  }
}
