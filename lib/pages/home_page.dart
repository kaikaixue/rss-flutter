import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss/pages/common/sidebar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },),
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
        child:
        Container(
          alignment: Alignment.center,
          child:  feedList.length > 0 ? _gridList() : _emptyBox(),
        )
      ),
      drawer: const SidebarMenu(),
    );
  }

  Widget _emptyBox() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/box.png", width: 70.r, height: 70.r,),
          SizedBox(height: 5.h,),
          Text("这里什么都没有！", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          SizedBox(height: 5.h,),
          GestureDetector(
            child: const Text("添加订阅源", style: TextStyle(color: Colors.blue),),
            onTap: () {},
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
}
