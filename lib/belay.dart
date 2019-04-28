import 'package:flutter/material.dart';
import 'customRadio.dart';

class Belay extends StatefulWidget {
  Belay({Key key}) : super(key: key);

  @override
  _BelayState createState() => _BelayState();
}

class _BelayState extends State<Belay> {
  String type = 'Lead';

  _buildBelayModal() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              'Belay',
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: ToggleRadio.rowStyle(
                          label: 'Lead',
                          value: 'Lead',
                          icon: Icons.arrow_upward,
                          groupValue: type,
                          onChanged: (String val) {
                            setState(
                              () {
                                type = val;
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: ToggleRadio.rowStyle(
                          label: 'Auto',
                          value: 'Auto',
                          groupValue: type,
                          icon: Icons.arrow_upward,
                          onChanged: (String val) {
                            setState(
                              () {
                                type = val;
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: ToggleRadio.rowStyle(
                          label: 'Toprope',
                          value: 'Toperope',
                          groupValue: type,
                          onChanged: (String val) {
                            setState(
                              () {
                                type = val;
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBelayModal();
  }
}
