import 'package:flutter/material.dart';
import 'customRadio.dart';
import 'dart:math';
import 'dart:core';

const FR_SET = [
  '4a',
  '4a+',
  '4b',
  '4b+',
  '4c',
  '4c+',
  '5a',
  '5a+',
  '5b',
  '5b+',
  '5c',
  '5c+',
  '6a',
  '6a+',
  '6b',
  '6b+',
  '6c',
  '6c+',
  '7a',
  '7a+',
  '7b',
  '7b+',
  '7c',
  '7c+',
  '8a'
];
const PL_SET = [
  'IV+',
  'V-',
  'V',
  'V+',
  'VI-',
  'VI',
  'VI+',
  'VI.1',
  'VI.1+',
  'VI.2',
  'VI.2+',
  'VI.3',
  'VI.3+',
  'VI.4',
  'VI.4+',
  'VI.5',
  'VI.5+'
];

class Grade extends StatefulWidget {
  Grade({Key key}) : super(key: key);

  @override
  _GradeState createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  String type = 'French';
  List<String> gradeSet;
  double _ang;
  bool editing;
  GlobalKey _keyRed = GlobalKey();
  FocusNode focusNode = FocusNode();
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    gradeSet = FR_SET;
    _ang = 0;
    textController.text =
        gradeSet[initGradeObj(wrapRadianTo2pi(_ang)).floor()].toString();
  }

  initGradeObj(selectedSng) {
    return selectedSng / ((2 * pi) / gradeSet.length);
  }

  _createKnob(BuildContext c) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        RenderBox b = _keyRed.currentContext.findRenderObject();
        Offset center = Offset(
            -b.globalToLocal(Offset.zero).dx, -b.globalToLocal(Offset.zero).dy);
        double width = b.size.width;
        setState(() {
          _ang = atan2(details.globalPosition.dy - (center.dy + width / 2),
                  details.globalPosition.dx - (center.dx + width / 2)) +
              pi / 2;
        });
        textController.text =
            gradeSet[initGradeObj(wrapRadianTo2pi(_ang)).floor()].toString();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xff29000000),
                blurRadius: 4.0,
                spreadRadius: 2.5,
                offset: Offset(0.0, 2.0)),
          ],
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff29000000),
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                  offset: Offset(0.0, 1.0),
                ),
              ],
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  _buildGradeModal(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Scale and Grade',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 2.0),
                      blurRadius: 3.0,
                      color: Color(0xff29000000),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ToggleRadio.columnStyle(
                        label: 'French',
                        value: 'French',
                        groupValue: type,
                        onChanged: (String val) {
                          setState(() {
                            type = val;
                            gradeSet = FR_SET;
                          });
                          textController.text = gradeSet[
                                  initGradeObj(wrapRadianTo2pi(_ang)).floor()]
                              .toString();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ToggleRadio.columnStyle(
                        label: 'Polish',
                        value: 'Polish',
                        groupValue: type,
                        onChanged: (String val) {
                          setState(() {
                            type = val;
                            gradeSet = PL_SET;
                          });
                          textController.text = gradeSet[
                                  initGradeObj(wrapRadianTo2pi(_ang)).floor()]
                              .toString();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            key: _keyRed,
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Transform.rotate(
                    angle: _ang,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xff2e707070),
                              width: 8.0,
                            ),
                          ),
                        ),
                        Positioned(
                          child: _createKnob(_keyRed.currentContext),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            _ang = _ang - (2 * pi) / gradeSet.length;
                          });
                          textController.text = gradeSet[
                                  initGradeObj(wrapRadianTo2pi(_ang)).floor()]
                              .toString();
                        },
                        child: Icon(
                          Icons.minimize,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Container(
                        width: 100,// Todo dynamic sizing
                        height: 70,
                        child: TextField(
                          onSubmitted: (String val) {
                            int i = gradeSet.indexOf(val);
                            if (i >= 0) {
                              setState(() {
                                _ang = (2 * pi) / gradeSet.length * i;
                              });
                            } else {
                              print('Invalid Input');
                            }
                          },
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            decoration: TextDecoration.none,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 2.0),
                                blurRadius: 3.0,
                                color: Color(0xff29000000),
                              ),
                            ],
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: textController,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _ang = _ang + (2 * pi) / gradeSet.length;
                          });
                          textController.text = gradeSet[
                                  initGradeObj(wrapRadianTo2pi(_ang)).floor()]
                              .toString();
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  double wrapRadianTo2pi(double ang) {
    if (ang < 0) {
      ang += 2 * pi;
    }
    if (ang > 2 * pi) {
      ang -= 2 * pi;
    }
    return ang;
  }

  @override
  Widget build(BuildContext context) {
    return _buildGradeModal(context);
  }
}
