import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;
import 'globaldata.dart';

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class Member extends StatefulWidget {
  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<Member> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  bool loginStatus = true; //注册还是登录
  bool isLogout; //是否已经登录

  logout() {
    userService.changeUser('');
    setState(() {
      isLogout = true;
    });
  }

  @override
  initState() {
    super.initState();
    if (userService.username.isEmpty) {
      setState(() {
        isLogout = true;
      });
    } else {
      isLogout = false;
    }
  }

  changeLoginStatus() {
    setState(() {
      loginStatus = !loginStatus;
    });
  }

  signin(String user, String pwd) async {
    var _url = 'http://129.204.49.171:3000/signin';
    var data = await http.post(_url, body: {'user': user, 'password': pwd});
    var dcdata = json.decode(data.body);
    if (dcdata["code"] == 200) {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 800),
        content: Text('注册成功！'),
      ));
      changeLoginStatus();
    }
    if (dcdata["code"] == 412) {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 800),
        content: Text('注册失败，用户已存在'),
      ));
    }
  }

  login(String user, String pwd) async {
    //http://127.0.0.1:3000/login 登录
    //http://127.0.0.1:3000/siginin 注册
    var url = 'http://129.204.49.171:3000/login';
    // var url2 = 'http://129.204.49.171:5005/json/112';
    var data = await http.post(url, body: {'user': user, 'password': pwd});
    // var response = await http.get(url);
    // print(json.decode(data.body)["data"]["user"]);
    if (data.statusCode == 200) {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 800),
        content: Text('登陆成功,即将转到主页'),
      ));
      userService.changeUser(user);
      Future.delayed(Duration(milliseconds: 800), () {
        navbarService.changeNavBarIndex(0);
      });
      userService.changeUser(user);
      setState(() {
        isLogout = false;
      });
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000),
        content: Text('登陆失败，请检查用户名和密码'),
      ));
    }
    // print('Response status: ${response.body}');
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: fullWidth(context) / 4.5,
              color: Color(0xFFF5F5F5), //手机号登录栏颜色
              child: SafeArea(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(),
                    ),
                    // 搜索
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Center(
                            child: Text(
                          '个人中心',
                          style:
                              TextStyle(fontSize: 17.0, color: Colors.black87),
                        )),
                      ),
                    ),
                    // 消息
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: isLogout
                                ? InkWell(
                                    onTap: changeLoginStatus,
                                    child: Text(loginStatus ? '注册' : '登录'))
                                : InkWell(onTap: logout, child: Text('退出登录'))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150.0,
              child: Container(
                height: 50.0,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      'http://yanxuan.nosdn.127.net/bd139d2c42205f749cd4ab78fa3d6c60.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            StreamBuilder(
              initialData: '',
              stream: userService.nameSteam$,
              builder: (context, snapshot) {
                if (snapshot.data.isEmpty) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18.0,
                          right: 18.0,
                        ),
                        child: TextField(
                          key: GlobalKey(),
                          controller: nameController,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent)),
                              hintText: '用户名'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18.0,
                          right: 18.0,
                        ),
                        child: TextField(
                          obscureText: true,
                          key: GlobalKey(),
                          controller: passwordController,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent)),
                              hintText: '密码'),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 45.0,
                          color: loginStatus
                              ? Color(0xFFb4282d)
                              : Colors.blueAccent,
                          margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(loginStatus ? '登录' : '注册',
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white))
                            ],
                          ),
                        ),
                        onTap: (loginStatus
                            ? () => login(
                                nameController.text, passwordController.text)
                            : () => signin(
                                nameController.text, passwordController.text)),
                      ),
                    ],
                  );
                } else {
                  return Text('欢迎你，${userService.username}');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
