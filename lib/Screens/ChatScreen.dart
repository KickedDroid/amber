import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmit(String text) {
    _chatController.clear();
      ChatMessage message = new ChatMessage(
        text: text
    );
      
    setState(() {
       _messages.insert(0, message);
    });
}

  Widget _chatEnvironment (){
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 24.0),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Colors.cyan,
              elevation: 10.0,
                        child: new Container(
        margin: const EdgeInsets.symmetric(horizontal:8.0),
        child: new Row(
              children: <Widget>[
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextField(
                      decoration: new InputDecoration.collapsed(hintText: "Start typing ..."
                      ),
                      controller: _chatController,
                      onSubmitted: _handleSubmit,
                    ),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: new IconButton(
                    icon: new Icon(Icons.send),
                    
                    onPressed: ()=> _handleSubmit(_chatController.text),
                     
                  ),
                )
              ],
        ),

      ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  statusBarColor: Colors.lightBlue, //or set color with: Color(0xFF0000FF)
  statusBarIconBrightness: Brightness.light
)); 
    // TODO: implement build
    return Scaffold(
          body: new Column(
          children: <Widget>[
            new Flexible(
              child: ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            new Container(
            child: _chatEnvironment(),)
          ],
        ),
    );
    }
  }

  class ChatMessage extends StatelessWidget {
  final String text;
  static const String _name = "Aidan";
// constructor to get text from textfield
  ChatMessage({
    this.text
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Material(
            shadowColor: Colors.lightBlue,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),

                )
              ],
            ),
                      ),
          ),
                    new Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: new CircleAvatar(
              child: new Image.network("http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png"),
              ),
          ),
        ],
      )
    );
  }
}