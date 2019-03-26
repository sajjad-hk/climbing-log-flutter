import 'package:flutter/material.dart';
import 'customRadio.dart';

class Tags extends StatefulWidget {
  Tags({Key key}) : super(key: key);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  String style1 = 'Flash';
  String style2 = 'On Sight';

  _buildTagsModal() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 90.0, bottom: 92.0),
          child: Text(
            'Tags',
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Style',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomRadio(
                      value: 'On Sight',
                      groupValue: style1,
                      onChanged: (String val) {
                        setState(() {
                          style1 = style1 == val ? '' : val;
                        });
                      },
                      checked: Container(
                        height: 57.0,
                        width: 146.0,
                        decoration: BoxDecoration(
                          color: Color(0x4d000000),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      notChecked: Container(
                        height: 57.0,
                        width: 146.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomRadio(
                      value: 'On Sight',
                      groupValue: style2,
                      onChanged: (String val) {
                        setState(() {
                          style2 = style2 == val ? '' : val;
                        });
                      },
                      checked: Container(
                        height: 57.0,
                        width: 146.0,
                        decoration: BoxDecoration(
                          color: Color(0x4d000000),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      notChecked: Container(
                        height: 57.0,
                        width: 146.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Other',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Wrap(
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    // TextField(

                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        mini: true,
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Color(0xff8b8b8b),
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTagsModal();
  }
}
