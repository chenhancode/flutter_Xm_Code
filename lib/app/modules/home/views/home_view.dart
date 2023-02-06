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
              })),
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
