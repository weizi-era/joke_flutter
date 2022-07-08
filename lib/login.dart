import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as Http;
import 'package:dio/dio.dart';
import 'package:login_flutter/home.dart';
import 'package:login_flutter/register.dart';
import 'package:login_flutter/user_info.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var passwordVisiable;

  TextEditingController _accountController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisiable = false;
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 130),
              child: Image.asset(
                "images/flutter.png",
                width: 64,
                height: 64,
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 80, left: 20, right: 20),
                        child: TextField(
                          controller: _accountController,
                          decoration: InputDecoration(
                            hintText: "手机号/用户名/邮箱",
                            prefixIcon: Icon(Icons.person),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _accountController.clear();
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: !passwordVisiable,
                          decoration: InputDecoration(
                            hintText: "密码",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisiable = !passwordVisiable;
                                });
                              },
                              icon: Icon(passwordVisiable ? Icons.visibility : Icons.visibility_off),
                            ),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: FlatButton(
                          minWidth: MediaQuery.of(context).size.width - 40,
                          color: Colors.blue,
                          highlightColor: Colors.blue[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () {
                            _login();
                          },
                          child: Text("登录")),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return RegisterPage();
                            }));
                          }, child: Text("立即注册")),
                          TextButton(onPressed: () {}, child: Text("忘记密码")),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              "images/qq.png",
                              width: 32,
                              height: 32,
                            ),
                            Container(
                              child: Text("QQ登录"),
                            ),
                          ],
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              "images/wechat.png",
                              width: 32,
                              height: 32,
                            ),
                            Container(
                              child: Text("微信登录"),
                            ),
                          ],
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              "images/weibo.png",
                              width: 32,
                              height: 32,
                            ),
                            Container(
                              child: Text("微博登录"),
                            ),
                          ],
                        )),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  _login() {

    EasyLoading.show(status: '登录中...');

    if (_accountController.text.trim().isEmpty) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
          msg: "请输入账号",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (_passwordController.text.trim().isEmpty) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
          msg: "请输入密码",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    Map<String, dynamic> params = {
      "username": _accountController.text.toString(),
      "password": _passwordController.text.toString()
    };


    //login 操作
    var url = Uri.parse("https://www.wanandroid.com/user/login");
    Http.post(url, body: params).then((value) {
      print(value);
      UserInfo userInfo = UserInfo.fromJson(json.decode(value.body.toString()));
      if (userInfo.errorCode == 0) {
        EasyLoading.dismiss();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomePage(
           // userInfo: userInfo,
          );
        }));
      } else {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg: "账号密码不匹配！",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }
}
