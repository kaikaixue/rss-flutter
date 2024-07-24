import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white,),
          onPressed: () {},
        ),
        backgroundColor: Colors.deepPurple,
        title: Text('订阅', style: TextStyle(color: Colors.white, fontSize: 18.sp),),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh, color: Colors.white)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
    );
  }

}