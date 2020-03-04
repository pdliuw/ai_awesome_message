import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'message_popup_route.dart';

///
/// PopupPage
class PopupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PopupState();
  }
}

///
/// PopupState
class PopupState extends State<PopupPage> {
  ///
  ///
  void _showTopPicker() {
    Navigator.of(context, rootNavigator: true).push(
      MessagePopupRoute(
        barrierLabel: 'Dismiss',
        semanticsDismissible: false,
        builder: (context) {
          return Container(
            height: 200,
            color: Colors.green,
            child: Scaffold(
              backgroundColor: Colors.green,
              body: Container(
                child: CupertinoPicker(
                    itemExtent: 42,
                    onSelectedItemChanged: (index) {},
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {},
                        child: Text("first"),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text("first"),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text("first"),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showTopPopup() {
    Navigator.of(context, rootNavigator: true).push(
      MessagePopupRoute(
        barrierLabel: 'Dismiss',
        semanticsDismissible: false,
        builder: (context) {
          return Container(
            height: 200,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(leading: Text("Air")),
                    ListTile(leading: Text("Jack")),
                    ListTile(leading: Text("Lucy")),
                    ListTile(leading: Text("Tom")),
                    ListTile(leading: Text("James")),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Airoute.push(
            route: AwesomeMessageRoute(
              awesomeMessage: AwesomeHelper.createAwesome(
                  title: "哈哈哈", message: "提示的具体的消息的展示"),
              theme: null,
              settings: RouteSettings(name: "/flushRouteName"),
            ),
          );
        },
        label: Text("message"),
        icon: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: MaterialButton(
              onPressed: () {
                _showTopPopup();
              },
              child: Text("top popup"),
            ),
          ),
          MaterialButton(
            onPressed: () {
              _showTopPicker();
            },
            child: Text("top popup+picker"),
          ),
        ],
      ),
    );
  }
}
