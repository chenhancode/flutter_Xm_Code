import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xiaomishop/app/services/httpsClient.dart';
import '../controllers/home_controller.dart';
import '../../../services/keepAliveWrapper.dart';
import '../../../services/xmIcon.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

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
            return Image.network(
              HttpsClient.replaeUri(controller.swiperList[index].pic),
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
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 140.h,
                        height: 140.h,
                        child: Image.network(
                          HttpsClient.replaeUri(
                              controller.homeCategory[i + 10 * index].pic),
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
                  child: Obx(
                    () => Swiper(
                      itemBuilder: (context, index) {
                        return Image.network(
                          HttpsClient.replaeUri(
                              controller.bestSellingSwiperList[index].pic),
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: controller.bestSellingSwiperList.length,
                      pagination: SwiperPagination(
                          margin: const EdgeInsets.all(0.0),
                          builder: SwiperCustomPagination(builder:
                              (BuildContext context,
                                  SwiperPluginConfig config) {
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
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 738.h,
                  // color: Color.fromARGB(255, 12, 59, 18),
                  child: Obx(
                    () => Column(
                      children:
                          controller.rxzxList.asMap().entries.map((entrie) {
                        var value = entrie.value;

                        return Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0, 0, 0, entrie.key == 2 ? 0 : 20.h),
                            color: const Color.fromRGBO(246, 246, 246, 1),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20.h),
                                      Text("${value.title}",
                                          style: TextStyle(
                                              fontSize: 38.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 20.h),
                                      Text("${value.subTitle}",
                                          style: TextStyle(fontSize: 28.sp)),
                                      SizedBox(height: 20.h),
                                      Text("￥${value.price}元",
                                          style: TextStyle(fontSize: 34.sp))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.h),
                                    child: Image.network(
                                      HttpsClient.replaeUri(value.pic),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // 瀑布流
  Widget _beatGoods() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '省心优惠',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 46.sp,
                ),
              ),
              Text(
                '全部优惠>',
                style: TextStyle(
                  fontSize: 38.sp,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Container(
            padding: EdgeInsets.all(26.h),
            color: const Color.fromRGBO(246, 246, 246, 1),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 25.h,
              crossAxisSpacing: 25.h,
              itemCount: controller.rmspList.length,
              shrinkWrap: true,
              //收缩让子元素宽度自适应
              physics: const NeverScrollableScrollPhysics(),
              //设置组件不滑动
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.w),
                        child: Image.network(
                          HttpsClient.replaeUri(
                              controller.rmspList[index].sPic),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.h),
                        width: double.infinity,
                        child: Text(
                          '${controller.rmspList[index].title}',
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.h),
                        width: double.infinity,
                        child: Text(
                          '${controller.rmspList[index].subTitle}',
                          style: TextStyle(fontSize: 32.sp),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.h),
                        width: double.infinity,
                        child: Text(
                          '￥${controller.rmspList[index].price}元',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  // 内容区
  Widget _homeBody() {
    return Positioned(
      top: -108.w,
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
          _beatGoods(),
          const SizedBox(
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
