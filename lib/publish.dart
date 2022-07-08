import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_flutter/main.dart';
import 'package:permission_handler/permission_handler.dart';

class PublishPage extends StatefulWidget {
  const PublishPage({Key? key}) : super(key: key);

  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  TextEditingController _publishController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _images;
  XFile? _video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          "发布帖子",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MainPage();
              }));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "发布",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith((states) {
              return Colors.transparent;
            })),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              maxLines: 10,
              controller: _publishController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "来点料呗，我送你上推荐~",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {
                          var status = await Permission.photos.status;
                          if (status.isDenied) {
                            Fluttertoast.showToast(
                                msg: "请打开权限",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            _pickPhoto();
                          }
                        },
                        icon: Icon(
                          Icons.photo,
                          size: 30,
                          color: Colors.deepOrange,
                        )),
                    IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {
                          _pickVideo();
                        },
                        icon: Icon(
                          Icons.ondemand_video,
                          size: 30,
                          color: Colors.deepOrange,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${_publishController.text.length} / 300字",
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Center(
              child: this._images == null ? Image.asset("images/weibo.png") : Image.file(File(_images!.path)),
            )
          ],
        ),
      ),
    );
  }

  _pickPhoto() async {
    XFile? images = await _picker.pickImage(source: ImageSource.gallery, maxWidth: 100, maxHeight: 100);
    if (images != null) {
      setState(() {
        this._images = images;
      });
    }
  }

  _pickVideo() async {
    XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        this._video = video;
      });
    }
  }
}
