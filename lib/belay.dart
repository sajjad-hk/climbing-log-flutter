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
        Padding(
          padding: const EdgeInsets.only(top: 90.0, bottom: 92.0),
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleRadio.rowStyle(
                label: 'Lead',
                value: 'Lead',
                height: 68.0,
                width: 168.0,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleRadio.rowStyle(
                label: 'Auto',
                value: 'Auto',
                groupValue: type,
                height: 68.0,
                width: 168,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleRadio.rowStyle(
                label: 'Toprope',
                value: 'Toperope',
                groupValue: type,
                height: 68.0,
                width: 168.0,
                onChanged: (String val) {
                  setState(
                    () {
                      type = val;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBelayModal();
  }
}
