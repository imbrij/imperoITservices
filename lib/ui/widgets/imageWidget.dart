import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impero_it_services/confiq/constants.dart';

class ImageWidget extends StatelessWidget {
  final String productName;
  final String priceCode;
  final String imageUrl;

  ImageWidget({this.productName, this.priceCode, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                '$imageUrl',
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width / 3,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blue,
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              alignment: Alignment.topLeft,
              child: Text(
                '$priceCode',
                style: priceCodeTxt,
              )),
        ]),
        SizedBox(
          height: 5,
        ),
        Text(
          "$productName",
          style: productNameTxt,
        ),
      ],
    );
  }
}
