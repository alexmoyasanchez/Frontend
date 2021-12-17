import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ChatList/chatList_screen.dart';
import 'dart:convert';
import 'package:flutter_auth/SideBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/models/community_model.dart';
import 'package:intl/intl.dart';

Future<List<Message>> getMessages() async {
  List<Message> messages = [];
  final data = await http.get(Uri.parse('http://localhost:3000/chat'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    Message message = Message(
      sender: u["sender"],
      time: u["time"],
      text: u["text"],
    );
    messages.add(message);
  }
  print(messages.length);
  return messages;
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text = "";
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('Hm');
    String formatted = formatter.format(now);
    String name = currentUser.name;

    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          'Chat',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Send message',
            ),
            onChanged: (value) {
              text = value;
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Colors.blueAccent,
            onPressed: () {
              SendMessage(name, text, formatted);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatScreen();
              }));
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            iconSize: 25.0,
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatScreen();
              }));
            },
          ),
          Expanded(
              child: FutureBuilder(
                  future: getMessages(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null) {
                      return Container(
                          child: Center(child: CircularProgressIndicator()));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(snapshot.data[index].text,
                                style: TextStyle(
                                    color: Colors.pink[800],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(
                                'Enviado por: ' +
                                    snapshot.data[index].sender +
                                    'A las ' +
                                    snapshot.data[index].time,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          );
                        },
                      );
                    }
                  }))
        ],
      ),
    );
  }
}

void EnviarMensaje(String sender, String text, String time) {
  final Message message = Message(
    sender: currentUser.name,
    text: text,
    time: time,
  );
}

Future<Message> SendMessage(String sender, String text, String time) async {
  sender = "b";
  final response = await http.post(
    Uri.parse('http://localhost:3000/chat/new/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'sender': sender,
      'text': text,
      'time': time,
    }),
  );
}

Future<Message> DeleteChat() async {
  String sender = "a";
  final response = await http.delete(
    Uri.parse('http://localhost:3000/chat/delete'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'sender': sender,
    }),
  );
}
