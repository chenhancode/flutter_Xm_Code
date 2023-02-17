import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //引入宽高
import 'package:get/get.dart';
import './phird_page_view.dart';
import './scvond_page_view.dart';
import '../controllers/product_content_controller.dart';
import './first_page_view.dart';
class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);

  Widget _appBar(BuildContext context) {
    return Obx(
      () => AppBar(
        title: SizedBox(
          width: 400.w,
          height: 96.h,
          child: controller.showTabs.value
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: controller.tabsList.map((v) {
                    return InkWell(
                      onTap: () {
                        controller.changeTabsIndex(v['id']);
                        if (v['id'] == 1) {
                          Scrollable.ensureVisible(
                            controller.gk1.currentContext as BuildContext,
                            duration: const Duration(milliseconds: 500),
                          );
                        } else if (v['id'] == 2) {
                          Scrollable.ensureVisible(
                            controller.gk2.currentContext as BuildContext,
                            duration: const Duration(milliseconds: 500),
                          );
                        } else {
                          Scrollable.ensureVisible(
                            controller.gk3.currentContext as BuildContext,
                            duration: const Duration(milliseconds: 500),
                          );
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${v["title"]}',
                            style: TextStyle(fontSize: 36.sp),
                          ),
                          controller.selectTabsList.value == v['id']
                              ? Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  width: 100.w,
                                  height: 4.h,
                                  color: Colors.red,
                                )
                              : Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  width: 100.w,
                                  height: 4.h,
                                ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              : const Text(''),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(controller.opcity.value),
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(15.w),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              backgroundColor: MaterialStateProperty.all(Colors.black12),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(const CircleBorder()),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.w),
            width: 88.w,
            height: 88.w,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(const CircleBorder()),
              ),
              onPressed: () {},
              child: const Icon(
                Icons.file_upload_outlined,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.w),
            width: 88.w,
            height: 88.w,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(const CircleBorder()),
              ),
              onPressed: () {
                showMenu(
                  color: Colors.black87.withOpacity(0.7),
                  context: context,
                  position: RelativeRect.fromLTRB(800.w, 220.h, 20.w, 0),
                  items: [
                    PopupMenuItem(
                        child: Row(
                      children: const [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Text(
                          '首页',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: const [
                        Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        Text(
                          '消息',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Text(
                          '收藏',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                  ],
                );
              },
              child: const Icon(
                Icons.more_horiz_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          FirstPageView(),
          ScvondPageView(),
          PhirdPageView(),
        ],
      ),
    );
  }

  Widget _bottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 2.w, color: Colors.black26),
            )),
        child: Row(
          children: [
            SizedBox(
              width: 200.w,
              height: 160.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Icon(Icons.shopping_cart),
                  Text('购物车',style: TextStyle(
                    fontSize: 32.sp,
                  ),),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  height: 120.h,
                  margin: EdgeInsets.only(right: 20.w),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 165, 0, 0.9),
                        )),
                    onPressed: () {},
                    child: const Text('加入购物车'),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  height: 120.h,
                  margin: EdgeInsets.only(right: 20.w),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(253, 1, 0, 0.9),
                        )),
                    onPressed: () {},
                    child: const Text('立即购买'),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //实现透明导航
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.h),
        child: _appBar(context),
      ),
      body: Stack(
        children: [_body(), _bottom()],
      ),
    );
  }
}
