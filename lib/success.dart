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
        Padding(
          padding: const EdgeInsets.only(top: 90.0, bottom: 92.0),
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
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: ToggleRadio.columnStyle(
            label: 'Yes',
            value: 'Yes',
            groupValue: mode,
            height: 110.0,
            width: 140.0,
            icon: Icons.tag_faces,
            onChanged: (String val) {
              setState(() {
                mode = val;
              });
            },
          ),
        ),
        ToggleRadio.columnStyle(
          label: 'No',
          value: 'No',
          groupValue: mode,
          height: 110.0,
          width: 140.0,
          icon: Icons.tag_faces,
          onChanged: (String val) {
            setState(() {
              mode = val;
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuccessModal();
  }
}
