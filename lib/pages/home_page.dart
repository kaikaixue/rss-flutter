import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rss/pages/common/sidebar.dart';
import 'package:flutter_rss/pages/feed/feed_page.dart';
import 'package:flutter_rss/pages/feed/feed_vm.dart';
import 'package:flutter_rss/routes/RouteUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List feedList = [];

  TextEditingController inputController = TextEditingController();
  FeedViewModel feedViewModel = FeedViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '订阅',
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: feedList.length > 0 ? _gridList() : _emptyBox(),
      )),
      drawer: const SidebarMenu(),
    );
  }

  Widget _emptyBox() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/box.png",
            width: 70.r,
            height: 70.r,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "这里什么都没有！",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          SizedBox(
            height: 5.h,
          ),
          GestureDetector(
            child: const Text(
              "添加订阅源",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              showAddFeedDialog();
            },
          )
        ],
      ),
    );
  }

  Widget _gridList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 4),
      itemBuilder: (context, index) {
        return _gridListItem();
      },
      itemCount: 20,
    );
  }

  Widget _gridListItem() {
    return Container(
      height: 40,
      color: Colors.blue,
    );
  }

  // 弹出对话框
  Future<void> showAddFeedDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 200.h,
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('添加订阅源', style: TextStyle(fontSize: 16.sp),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _dialogTextButton(text: "粘贴", onTap: _pasteText),
                      _dialogTextButton(text: "清空", onTap: () {
                        inputController.clear();
                      }),
                      SizedBox(width: 100.w,),
                      _dialogTextButton(text: "RSS推荐", onTap: () {}),
                      const Text("RSS HUB", style: TextStyle(color: Colors.orange),),
                    ],
                  ),
                  TextField(autofocus: true, controller: inputController,
                  decoration: const InputDecoration(
                    hintText: "订阅源地址"
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _dialogTextButton(text: "取消", onTap: () {
                        Navigator.of(context).pop();
                      }),
                      SizedBox(width: 20.w),
                      _dialogTextButton(text: "下一步", onTap: () {
                        if (inputController.text != "") {
                          feedViewModel.analysisRssUrl(inputController.text).then((value) {
                            RouteUtils.push(context, const FeedPage());
                          });
                        }
                      }),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  //
  Widget _dialogTextButton({required String text, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text ?? "",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  /// 粘贴
  Future<void> _pasteText() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    inputController.text = data?.text ?? '';
  }
}
