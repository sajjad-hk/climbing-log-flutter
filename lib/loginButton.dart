import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton(
      {@required this.icon, @required this.label, @required this.onPressed});

  final IconData icon;
  final String label;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: 60.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        color: Color(0xFF0e1823),
        textColor: Colors.white,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(icon),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                label,
              ),
            )
          ],
        ),
      ),
      width: 240,
    );
  }
}
