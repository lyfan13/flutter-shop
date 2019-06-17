import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'showone.dart';

class AfterList extends StatelessWidget {
  final String url;
  const AfterList(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 35.0,
              color: Colors.transparent,
              child: Row(
                children: <Widget>[
                  // 扫二维码
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 24.0,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  // 搜索
                  Expanded(
                    child: Container(
                      height: 40.0,
                      child: Center(
                          child: Text(
                        '当季热销',
                        style: TextStyle(fontSize: 17.0, color: Colors.black87),
                      )),
                    ),
                  ),
                  // 消息
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.search,
                      size: 24.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: WebView(
              // navigationDelegate: nav,
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              // navigationDelegate: (NavigationRequest request) {
              //   var id = request.url.substring(27);
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => ShowOne(id)),
              //   );
              //   return NavigationDecision.prevent;
              // },
              javascriptChannels: Set.from([
                JavascriptChannel(
                    name: 'Print',
                    onMessageReceived: (JavascriptMessage message) {
                      //This is where you receive message from
                      //javascript code and handle in Flutter/Dart
                      //like here, the message is just being printed
                      //in Run/LogCat window of android studio
                      print(message.message);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowOne(message.message)),
                      );
                    })
              ]),
            ),
          )
        ],
      ),
    );
  }
}
