import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as Http;
import 'package:login_flutter/login.dart';
import 'package:login_flutter/user_info.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _accountController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _repasswordController = TextEditingController();

  var passwordState;
  var repasswordState;

  @override
  void initState() {
    super.initState();
    passwordState = false;
    repasswordState = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("注册"),
      centerTitle: true,),
      body:  Container(
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
                flex: 3,
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
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: !passwordState,
                      decoration: InputDecoration(
                        hintText: "密码",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordState = !passwordState;
                            });
                          },
                          icon: Icon(passwordState ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: _repasswordController,
                      obscureText: !repasswordState,
                      decoration: InputDecoration(
                        hintText: "确认密码",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              repasswordState = !repasswordState;
                            });
                          },
                          icon: Icon(repasswordState ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: FlatButton(
                        minWidth: MediaQuery.of(context).size.width - 40,
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {
                          _register(_accountController.text.toString(), _passwordController.text.toString(),
                          _repasswordController.text.toString());
                        },
                        child: Text("注册")),
                  ),
                ],
            ))
          ],
        ),
      ),
    );
  }

  _register(String username, String password, String repassword) {
    if (username.isEmpty || password.isEmpty || repassword.isEmpty) {
      Fluttertoast.showToast(
          msg: "请输入完整信息",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (username.length < 3) {
      Fluttertoast.showToast(
          msg: "账号长度必须大于3位",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (password.length < 6) {
      Fluttertoast.showToast(
          msg: "密码长度必须大于6位",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (password.compareTo(repassword) != 0) {
      Fluttertoast.showToast(
          msg: "两次密码输入不一致",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    
    Map<String, dynamic> _registerMap = {
      "username" : username,
      "password" : password,
      "repassword" : repassword
    };
    
    var url = Uri.parse("https://www.wanandroid.com/user/register");
    Http.post(url, body: _registerMap).then((value) {
      print(value);
      UserInfo userInfo = UserInfo.fromJson(json.decode(value.body.toString()));
      if(userInfo.errorCode == 0) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      } else {
        Fluttertoast.showToast(
            msg: "用户名已经被注册",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return;
      }
    });
  }
}
