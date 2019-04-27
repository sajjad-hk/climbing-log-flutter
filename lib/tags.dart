import 'package:flutter/material.dart';
import 'customRadio.dart';

class Tags extends StatefulWidget {
  Tags({Key key}) : super(key: key);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  String style1;
  String style2;
  static TextEditingController tagTextController;
  static List<Widget> tags;


  @override
  void initState() {
    style1 = 'Flash';
    style2 = 'On Sight';
    tagTextController = TextEditingController();
    tags = [];
  }

  _buildTagsModal() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: Expanded(
            flex: 1,
            child: Center(
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
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: <Widget>[
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                      child: Text(
                        'Style',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: CustomRadio(
                              value: 'On Sight',
                              groupValue: style1,
                              onChanged: (String val) {
                                setState(() {
                                  style1 = style1 == val ? '' : val;
                                });
                              },
                              checked: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x4d000000),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Flash',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              notChecked: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Flash',
                                    style: TextStyle(
                                      color: Color(0x4d000000),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: CustomRadio(
                              value: 'On Sight',
                              groupValue: style2,
                              onChanged: (String val) {
                                setState(() {
                                  style2 = style2 == val ? '' : val;
                                });
                              },
                              checked: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x4d000000),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'On Sight',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              notChecked: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'On Sight',
                                    style: TextStyle(
                                      color: Color(0x4d000000),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                    child: Text(
                      'Other',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 10,
                children: tags,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                        ),
                        child: Container(
                          child: TextField(
                            textCapitalization: TextCapitalization.words,
                            textAlign: TextAlign.center,
                            controller: tagTextController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          if (tagTextController.text != null &&
                              tagTextController.text != '') {
                            setState(() {
                              tags.add(
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    tagTextController.text,
                                    style: TextStyle(
                                      color: Color(0x4d000000),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );
                            });
                          }
                          tagTextController.text = '';
                        },
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
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    // Save the route
                    // Go back to first tab
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        '+ LOG ANOTHER ROUTE',
                        style: TextStyle(color: Color(0xff4c000000), fontSize: 18),
                      ),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTagsModal();
  }
}
