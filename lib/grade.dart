import 'package:flutter/material.dart';
import 'customRadio.dart';

class Grade extends StatefulWidget {
  Grade({Key key}) : super(key: key);

  @override
  _GradeState createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  String type = 'French';

  _buildGradeModal() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 55.0),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleRadio.columnStyle(
                label: 'French',
                value: 'French',
                height: 42.0,
                width: 110,
                groupValue: type,
                onChanged: (String val) {
                  setState(() {
                    type = val;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleRadio.columnStyle(
                label: 'Polish',
                value: 'Polish',
                groupValue: type,
                height: 42.0,
                width: 110.0,
                onChanged: (String val) {
                  setState(() {
                    type = val;
                  });
                },
              ),
            ),
          ],
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 30.0, bottom: 30, left: 30, right: 30),
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          '+',
                          style: TextStyle(
                            color: Color(0xff4c000000),
                            fontSize: 60,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 2.0),
                                blurRadius: 3.0,
                                color: Color(0xff29000000),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '6a+',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 2.0),
                                blurRadius: 3.0,
                                color: Color(0xff29000000),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '-',
                          style: TextStyle(
                            color: Color(0xff4c000000),
                            fontSize: 100,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 2.0),
                                blurRadius: 3.0,
                                color: Color(0xff29000000),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xff2e707070),
                      width: 8.0,
                    ),
                  ),
                ),
                Draggable(
                  childWhenDragging: Container(),
                  feedback: Container(
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
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildGradeModal();
  }
}
