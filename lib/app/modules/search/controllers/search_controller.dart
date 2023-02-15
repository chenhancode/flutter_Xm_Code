import 'package:get/get.dart';
import '../../../services/searchServices.dart';
import '../../../services/storage.dart';
class SearchController extends GetxController {
  //TODO: Implement SearchController

  String Keywords = '';

  RxList historyList = [].obs;

  getHistoryData()async{
    var tempList = await SearchServices.getHistoryData();
    if(tempList.isNotEmpty){
      historyList.addAll(tempList);
      update();
    }
  }

  clearHistoryData()async{
    await SearchServices.clearHistoryData();
    historyList.clear();
    update();
  }

  removeHistoryData(value)async{
    var tempList = await SearchServices.getHistoryData();
    if(tempList.isNotEmpty){
      tempList.remove(value);
      await Storage.setData("searchList", tempList);
      historyList.remove(value);
      update();
    }
  }

  void onInit() {
    super.onInit();
    getHistoryData();
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
