import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impero_it_services/confiq/colorPicker.dart';
import 'package:impero_it_services/confiq/constants.dart';
import 'package:impero_it_services/models/colorPickerModel.dart';
import 'package:impero_it_services/ui/widgets/colorListWidget.dart';

class TestStripScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestStripScreen();
}

class _TestStripScreen extends State<TestStripScreen> {
  List<ColorPickerModel> colorpickerModel = List();
  String firstColor, secondColor, thirdColor, fourthColor;
  List<String> colorSeterList = List();
  List<String> testStripTitle = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstColor = "#cbcbcb";
    secondColor = "#cbddcb";
    thirdColor = "#cb00cb";
    fourthColor = "#cbffcb";

    colorSeterList.add(firstColor);
    colorSeterList.add(secondColor);
    colorSeterList.add(thirdColor);
    colorSeterList.add(fourthColor);

    testStripTitle.add("Total Hardness");
    testStripTitle.add("Total Chlorine");
    testStripTitle.add("pH");
    testStripTitle.add("Total Alkalinity");

    colorpickerModel.add(ColorPickerModel("#000000", 100));
    colorpickerModel.add(ColorPickerModel("#ff0000", 200));
    colorpickerModel.add(ColorPickerModel("#ffff00", 300));
    colorpickerModel.add(ColorPickerModel("#808000", 400));
    colorpickerModel.add(ColorPickerModel("#cde001", 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new FlatButton(
                padding: new EdgeInsets.all(0.0),
                onPressed: () {},
                child: new Container(
                  height: 30.0,
                  width: 80.0,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    color: Colors.black45,
                    borderRadius: new BorderRadius.circular(60.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /* new Image.asset(
                        "assets/Filter.png",
                        width: 10,
                        height: 10,
                      ),*/
                      Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  'Test Strip',
                  style: testStripHeader,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child:
                  /*ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return */
                  Container(
                /*  width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*2,*/
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin:
                              EdgeInsets.only(left: 5, right: 5, bottom: 20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black87,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child:
                              /*Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[*/
                              ListView.builder(
                            itemCount: colorSeterList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: MediaQuery.of(context).size.height / 6,
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        9.7),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      color: ColorPicker().getColorFromHex(
                                          colorSeterList[index]),
                                      height: 20,
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                          /*],
                        ),*/
                          ),
                    ),
                    Expanded(
                        flex: 7,
                        child: ListView.builder(
                          itemCount: testStripTitle.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 14,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "${testStripTitle[index]} ",
                                              style: testStripTitleTxt,
                                            ),
                                            Text(
                                              " (ppm)",
                                              style: testStripSubTitle,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          height: 55,
                                          width:80,
                                          child: TextFormField(
                                            textAlign: TextAlign.end,
                                            keyboardType: TextInputType.text,
                                            maxLength: 6,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  const Radius.circular(5.0),
                                                ),
                                              ),
                                              hintText: "0",
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                colorSeterList[index] = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
//                                width: MediaQuery.of(context).size.width/1.2,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 13,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: colorpickerModel.length,
                                        itemBuilder: (context, item) {
                                          return ColorListWidget(
                                            colorCode: colorpickerModel[item]
                                                .colorCode,
                                            colorAlpha: colorpickerModel[item]
                                                .colorAlpha,
                                            onTap: () {
                                              setState(() {
                                                colorSeterList[index] =
                                                    colorpickerModel[item]
                                                        .colorCode;
                                              });
                                            },
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ),
//                }),
            ),
          ],
        ),
      ),
    );
  }
}
