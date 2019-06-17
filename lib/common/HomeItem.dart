import 'package:flutter/material.dart';
import 'package:simpleshop/common/tag.dart';
import 'package:transparent_image/transparent_image.dart';

fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key key,
    @required this.oneItem,
  }) : super(key: key);
  final oneItem;
  @override
  Widget build(BuildContext context) {
    // Widget _child;
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                color: Color(0xFFF5F5F5),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: oneItem['imgurl'],
                  fit: BoxFit.fill,
                )),
            Container(
              child: Row(
                children: <Widget>[
                  oneItem['title'].isEmpty
                      ? SizedBox.shrink()
                      : ItemTitle(oneItem['title']),
                  oneItem['horizon'].isEmpty
                      ? PriceText(oneItem['price'], oneItem['delprice'])
                      : SizedBox.shrink()
                ],
              ),
            ),
            oneItem['horizon'].isEmpty
                ? SizedBox.shrink()
                : PriceText(oneItem['price'], oneItem['delprice']),
            oneItem['tag'].isEmpty ? SizedBox.shrink() : Tag(oneItem['tag'])
          ],
        ),
        oneItem['insideTag'].isEmpty
            ? SizedBox.shrink()
            : InsideTag(oneItem['insideTag']),
      ],
    );
  }
}




//类型选择标签
class InsideTag extends StatelessWidget {
  // List<Widget> insideList = List();
  final String insideTagName;
  const InsideTag(
    this.insideTagName, {
    Key key,
  }) : super(key: key);
  List<Widget> _oneBuilder() {
    List<Widget> childs = [];
    for (var i = 0; i < insideTagName.length; i++) {
      childs.add(
        Text(
          insideTagName[i],
          style:
              TextStyle(height: 0.9, fontSize: 9.0, color: Color(0xFFb4a078)),
        ),
      );
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.0,
      left: 10.0,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Color(0xFFb4a078))),
        child: Padding(
          padding: const EdgeInsets.only(top: 3.5, bottom: 3.5),
          child: Column(
            children: _oneBuilder(),
          ),
        ),
      ),
    );
  }
}


//商品标题
class ItemTitle extends StatelessWidget {
  final String title;
  const ItemTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: fullWidth(context)/30));
  }
}



//红色价格
class PriceText extends StatelessWidget {
  final String price;
  final String delprice;
  const PriceText(this.price, this.delprice);
  @override
  Widget build(BuildContext context) {
    if (delprice.isEmpty) {
      return Text(
        '￥' + price,
        style: TextStyle(color: Colors.red,fontSize: fullWidth(context)/28),
      );
    } else {
      return Row(
        children: <Widget>[
          Text(
            '￥' + price,
            style: TextStyle(color: Colors.red,fontSize: fullWidth(context)/28),
          ),
          Text(
            '￥' + delprice,
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Color(0xFF7F7F7F),fontSize: fullWidth(context)/28),
          ),
        ],
      );
    }
  }
}