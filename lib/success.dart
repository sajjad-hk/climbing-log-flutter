import 'package:flutter/material.dart';
import 'customRadio.dart';

class Success extends StatefulWidget {
  Success({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SuccessState();
}

class SuccessState extends State<Success> {
  SuccessState({Key key});

  String mode = 'Yes';

  _buildSuccessModal() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              'Succeded?',
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
        Expanded(
          flex: 4,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
                        child: ToggleRadio.columnStyle(
                          label: 'Yes',
                          value: 'Yes',
                          groupValue: mode,
                          icon: Icons.tag_faces,
                          onChanged: (String val) {
                            setState(() {
                              mode = val;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
                        child: ToggleRadio.columnStyle(
                          label: 'No',
                          value: 'No',
                          groupValue: mode,
                          icon: Icons.tag_faces,
                          onChanged: (String val) {
                            setState(() {
                              mode = val;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuccessModal();
  }
}
