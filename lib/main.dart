import 'package:flutter/material.dart';
import 'package:login_flutter/home.dart';
import 'package:login_flutter/me.dart';
import 'package:login_flutter/message.dart';
import 'package:login_flutter/publish.dart';
import 'package:login_flutter/video.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: Icon(Icons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: Icon(Icons.video_collection),
      label: "划一划",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: Icon(null),
      label: "",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: Icon(Icons.message),
      label: "消息",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: Icon(Icons.person),
      label: "我的",
    ),
  ];

// 创建数组引入页面
  List pglist = [
    HomePage(),
    VideoPage(),
    PublishPage(),
    MessagePage(),
    MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pglist[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _onItemSelected(index);
        },
      ),

      floatingActionButton: InkWell(
        highlightColor: Colors.transparent,
        radius: 0.0,
        child: Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.red),
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return PublishPage();
          }));
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.red,
      //   onPressed: () {
      //     _onItemSelected(_selectedIndex);
      //   },
      //   child: Icon(Icons.add,
      //   size: 36,),
      // ),
      floatingActionButtonLocation:  CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerDocked, 0, 15),
      floatingActionButtonAnimator: FloatActionBarNoAnimation(),

    );
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX; // X方向的偏移量
  double offsetY; // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}

class FloatActionBarNoAnimation extends FloatingActionButtonAnimator {
  double? _x;
  double? _y;
  @override
  Offset getOffset({Offset? begin, Offset? end, double progress = 0}) {
    _x = begin?.dx ?? 0 + (end?.dx ?? 0 - (begin?.dx ?? 0)) * progress;
    _y = begin?.dy ?? 0 + (end?.dy ?? 0 - (begin?.dy ?? 0)) * progress;
    return Offset(_x ?? 0, _y ?? 0);
  }

  @override
  Animation<double> getRotationAnimation({Animation<double>? parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent!);
  }

  @override
  Animation<double> getScaleAnimation({Animation<double>? parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent!);
  }
}

