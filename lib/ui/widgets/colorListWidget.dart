import 'package:flutter/cupertino.dart';
import 'package:impero_it_services/confiq/colorPicker.dart';

class ColorListWidget extends StatelessWidget {
  String colorCode;
  int colorAlpha;
  Function onTap;

  ColorListWidget({this.colorCode, this.colorAlpha, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: ColorPicker().getColorFromHex(colorCode),
              ),
              margin: EdgeInsets.only(right: 5),
              height: 20,
              width: 50,
            ),
            onTap: onTap,
          ),
          Text("$colorAlpha"),
        ],
      ),
    );
  }
}
