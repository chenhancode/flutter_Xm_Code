import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../services/keepAliveWrapper.dart';
import '../../../services/xmIcon.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  // 顶部导航
  Widget _getAppBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(
        () => AppBar(
          title: AnimatedContainer(
            width: controller.flag.value ? 800.w : 648.w,
            height: 96.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(237, 252, 243, 236),
              borderRadius: BorderRadius.circular(30),
            ),
            duration: const Duration(milliseconds: 300),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 4, 0),
                  child: Icon(Icons.search),
                ),
                Text(
                  '手机',
                  style: TextStyle(fontSize: 32.sp),
                ),
              ],
            ),
          ),
          centerTitle: true,
          backgroundColor:
              controller.flag.value ? Colors.white : Colors.transparent,
          elevation: 0,
          leading: controller.flag.value
              ? const Text('')
              : const Icon(
                  xmIcon.xiaomi,
                  color: Colors.white,
                ),
          leadingWidth: controller.flag.value ? 20.w : 140.w,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.qr_code,
                color: controller.flag.value ? Colors.black87 : Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color: controller.flag.value ? Colors.black87 : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 轮播图
  Widget _focus() {
    return SizedBox(
      width: 1080.w,
      height: 682.h,
      child: Obx(
        () => Swiper(
          itemBuilder: (context, index) {
            String picUrl =
                "https://xiaomi.itying.com/${controller.swiperList[index].pic}";
            return Image.network(
              picUrl.replaceAll("\\", "/"),
              fit: BoxFit.fill,
            );
          },
          itemCount: controller.swiperList.length,
          pagination: const SwiperPagination(
            builder: SwiperPagination.rect,
          ),
          autoplay: true,
          // duration: 3000,
        ),
      ),
    );
  }

  // banner
  Widget _banner() {
    return SizedBox(
      width: 1080.w,
      height: 92.h,
      child: Image.asset(
        'assets/images/xiaomiBanner.png',
        fit: BoxFit.cover,
      ),
    );
  }

  // category
  Widget _category() {
    return Container(
      width: 1080.w,
      height: 470.h,
      color: Colors.white,
      child: Obx(
        () => Swiper(
          itemBuilder: (context, index) {
            return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                ),
                itemBuilder: (context, i) {
                  String? url =
                      "https://xiaomi.itying.com/${controller.homeCategory[i + 10 * index].pic}";
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 140.h,
                        height: 140.h,
                        child: Image.network(
                          url.replaceAll("\\", "/"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 4.h, 0, 0),
                        child: Text(
                          "${controller.homeCategory[i + 10 * index].title}",
                          style: TextStyle(fontSize: 34.sp),
                        ),
                      ),
                    ],
                  );
                });
          },
          itemCount: controller.homeCategory.length ~/ 10,
          pagination: SwiperPagination(
            margin: const EdgeInsets.all(0.0),
            builder: SwiperCustomPagination(
                builder: (BuildContext context, SwiperPluginConfig config) {
              return ConstrainedBox(
                constraints: BoxConstraints.expand(height: 20.h),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: const RectSwiperPaginationBuilder(
                          color: Colors.black12,
                          activeColor: Colors.black54,
                        ).build(context, config),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _banner2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          image: const DecorationImage(
            image: AssetImage('assets/images/xiaomiBanner2.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: 420.h,
      ),
    );
  }

  // 热销
  Widget _bestSelling() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '热销甄选',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 46.sp,
                ),
              ),
              Text(
                '跟多手机>',
                style: TextStyle(
                  fontSize: 38.sp,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 20.h),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 738.h,
                  child: Swiper(
                    itemBuilder: (context, index) {
                      String picUrl =
                          "https://www.itying.com//images/b_focus0${index + 1}.png";
                      return Image.network(
                        picUrl.replaceAll("\\", "/"),
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 3,
                    pagination: SwiperPagination(
                        margin: const EdgeInsets.all(0.0),
                        builder: SwiperCustomPagination(builder:
                            (BuildContext context, SwiperPluginConfig config) {
                          return ConstrainedBox(
                            constraints: BoxConstraints.expand(height: 20.h),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: const RectSwiperPaginationBuilder(
                                      color: Colors.black12,
                                      activeColor: Colors.black45,
                                    ).build(context, config),
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
                    autoplay: true,
                    // duration: 3000,
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 738.h,
                  // color: Color.fromARGB(255, 12, 59, 18),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: const Color.fromRGBO(246, 246, 246, 1),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20.h),
                                    Text("空气炸烤箱",
                                        style: TextStyle(
                                            fontSize: 38.sp,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 20.h),
                                    Text("大容量专业炸考",
                                        style: TextStyle(fontSize: 28.sp)),
                                    SizedBox(height: 20.h),
                                    Text("众筹价￥345元",
                                        style: TextStyle(fontSize: 34.sp))
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(12.h),
                                  child: Image.network(
                                    'https://www.itying.com/images/shouji.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: const Color.fromRGBO(246, 246, 246, 1),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20.h),
                                    Text("空气炸烤箱",
                                        style: TextStyle(
                                            fontSize: 38.sp,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 20.h),
                                    Text("大容量专业炸考",
                                        style: TextStyle(fontSize: 28.sp)),
                                    SizedBox(height: 20.h),
                                    Text("众筹价￥345元",
                                        style: TextStyle(fontSize: 34.sp))
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(12.h),
                                  child: Image.network(
                                    'https://www.itying.com/images/shouji.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: const Color.fromRGBO(246, 246, 246, 1),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20.h),
                                    Text("空气炸烤箱",
                                        style: TextStyle(
                                            fontSize: 38.sp,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 20.h),
                                    Text("大容量专业炸考",
                                        style: TextStyle(fontSize: 28.sp)),
                                    SizedBox(height: 20.h),
                                    Text("众筹价￥345元",
                                        style: TextStyle(fontSize: 34.sp))
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(12.h),
                                  child: Image.network(
                                    'https://www.itying.com/images/shouji.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // 内容区
  Widget _homeBody() {
    return Positioned(
      top: -62.w,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController,
        children: [
          _focus(),
          _banner(),
          _category(),
          _banner2(),
          _bestSelling(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(children: [
          _homeBody(),
          _getAppBar(),
        ]),
      ),
    );
  }
}
