import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss/common_ui/custom_app_bar.dart';
import 'package:flutter_rss/common_ui/loading.dart';
import 'package:flutter_rss/pages/feed/feed_vm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key, required this.rssUrl});

  final String rssUrl;

  @override
  State<StatefulWidget> createState() {
    return _FeedPageState();
  }
}

class _FeedPageState extends State<FeedPage> {
  FeedViewModel feedViewModel = FeedViewModel();

  bool? showLoading;
  TextEditingController urlInputController = TextEditingController();
  TextEditingController titleInputController = TextEditingController();
  TextEditingController descInputController = TextEditingController();
  TextEditingController logoInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Loading.showLoading();
    showLoading = true;
    feedViewModel.analysisRssUrl(widget.rssUrl).then((rssInfo) {
      Loading.dismissAll();
      if (rssInfo != null) {
        urlInputController.text = rssInfo.url ?? "";
        titleInputController.text = rssInfo.title ?? "";
        descInputController.text = rssInfo.description ?? "";
        logoInputController.text = rssInfo.logoUrl ?? "";
      }
      showLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return feedViewModel;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          isBackButton: true,
          title: Text('订阅源',
              style: TextStyle(color: Colors.white, fontSize: 18.sp)),
        ),
        body:
        // SafeArea(
        //   child:
          Consumer<FeedViewModel>(
            builder: (context, vm, child) {
              return showLoading == false
                  ? Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 60.h),
                          child: Container(
                            alignment: Alignment.center,
                            width: 300.w,
                            height: 300.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  vm.feedModel?.feedLogo ?? "",
                                  width: 65.w,
                                  height: 65.h,
                                  fit: BoxFit.fill,
                                ),
                                _rowTextField(
                                    title: "URL:",
                                    onChanged: (value) {},
                                    controller: urlInputController),
                                _rowTextField(
                                    title: "名称:",
                                    onChanged: (value) {},
                                    controller: titleInputController),
                                _rowTextField(
                                    title: "描述:",
                                    onChanged: (value) {},
                                    controller: descInputController),
                                _rowTextField(
                                    title: "图标:",
                                    onChanged: (value) {},
                                    controller: logoInputController),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: _bottomWidgets())
                      ],
                    )
                  : Container();
            },
          ),
        ),
      // ),
    );
  }

  Widget _bottomWidgets() {
    return Container(
      width: double.infinity,
      height: 100.h,
      padding: EdgeInsets.only(right: 24.w, bottom: 24.w),
      color: Theme.of(context).colorScheme.primary,
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.check,
              color: Colors.white,
            ),
            SizedBox(
              width: 7.w,
            ),
            Text(
              "添加",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            )
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Widget _rowTextField(
      {String? title,
      ValueChanged<String>? onChanged,
      TextEditingController? controller}) {
    return Row(
      children: [
        Text(title ?? ""),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
            width: 240.w,
            height: 40.h,
            child: TextField(
              onChanged: onChanged,
              controller: controller,
            )),
      ],
    );
  }
}
