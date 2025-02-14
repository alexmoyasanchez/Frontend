import 'dart:developer';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ChatList/chatList_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/comunidades_model.dart';
import 'package:flutter_auth/models/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  final Comunidad room;
  // final String room.name;
  final String username;

  const ChatPage({Key key, this.room, this.username}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ScrollController controller = ScrollController();
  GlobalKey<FormState> formKey;
  TextEditingController messageController = TextEditingController();
  IO.Socket socket;
  List<Message> messages = [];
  String connectedUsers;
  List<dynamic> connectedUserList;
  List<String> connectedNames;
  FocusNode messageNode;

  @override
  void initState() {
    messageNode = FocusNode();
    initSocket();
    super.initState();
  }

  @override
  void dispose() {
    messageNode.dispose();
    return super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (this.mounted) {
      return super.setState(fn);
    }
  }

  void initSocket() {
    try {
      socket = IO.io('http://147.83.7.157:3000/', <String, dynamic>{
        'transports': ['websocket'],
      });
      socket.emit("login", [widget.room.name, currentUser.username]);
      // socket.on("updateUsers", (data) =>
      // print(data));
      socket.on("updateUsers", (con) {
        log("evento recibido!!");
        connectedUserList = con;
        connectedUsers = connectedUserList.toString();
        connectedNames = connectedUserList.cast<String>();
        log("Tengo las siguientes conexiones activas" +
            connectedUserList.toString());
      });
      // {
      //   Message con = (data is String)
      //       ? Message(message: data, username: "Conexion")
      //       : Message(message: data, username: "Tipo 2");
      //   log("ME HAN LLEGADO USUARIOS!! " +
      //       con.message +
      //       " tipo: " +
      //       con.username);
      //   connectedUsers = con.message;
      // }
      socket.on("sendMessage", (res) {
        Message msg = (res is String)
            ? Message(message: res, username: "Admin")
            : Message(message: res[0], username: res[1]);
        if (msg.username == currentUser.username) {
          return;
        }
        if (msg.message == null) {
          return;
        }
        log(msg.message);

        setState(() {
          messages.add(msg);
          controller.animateTo(controller.position.maxScrollExtent,
              duration: Duration(milliseconds: 100), curve: Curves.linear);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  void sendMessage() {
    try {
      socket.emit("sendMessage",
          [messageController.text, widget.room.name, currentUser.username]);
      Message msg = Message(
          message: messageController.text, username: currentUser.username);
      setState(() {
        messages.add(msg);
        controller.animateTo(controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 100), curve: Curves.linear);
      });
      messageController.clear();
      messageNode.requestFocus();
    } catch (e) {
      print(e);
    }
  }

  void checkConectados() {
    try {
      Message msg = Message(
          message:
              "Ahora mismo, en la sala están: " + connectedNames.toString(),
          username: "Sistema");
      setState(() {
        messages.add(msg);
        controller.animateTo(controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 100), curve: Curves.linear);
      });
      messageController.clear();
      messageNode.requestFocus();
    } catch (e) {
      print(e);
    }
  }

  void disconnectUser() {
    try {
      socket.emit("disconnected", [widget.room.name, currentUser.username]);
      Message msg = Message(
          message: messageController.text, username: currentUser.username);
      setState(() {
        messages.add(msg);
        controller.animateTo(controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 100), curve: Curves.linear);
      });
      messageController.clear();
      messageNode.requestFocus();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xBBb470b8),
        title: SelectableText(widget.room.name),
        leading: BackButton(
          onPressed: () {
            disconnectUser();
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => ListaChatsScreen()));
          },
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  checkConectados();
                },
                child: Icon(
                  Icons.info,
                  size: 26.0,
                ),
              )),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                controller: controller,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  if (message.username == currentUser.username) {
                    return Bubble(
                      margin: BubbleEdges.only(top: 8),
                      radius: Radius.circular(12),
                      alignment: Alignment.topRight,
                      nip: BubbleNip.rightTop,
                      elevation: 2,
                      color: Color(0xBBb470b8),
                      child: SelectableText(
                        message.message,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }
                  if (message.username == 'Admin') {
                    return Bubble(
                      margin: BubbleEdges.only(top: 8),
                      radius: Radius.circular(12),
                      alignment: Alignment.topLeft,
                      nip: BubbleNip.leftTop,
                      elevation: 2,
                      color: Color.fromRGBO(0, 0, 0, 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.username,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SelectableText(
                            message.message,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18, color: Color(0xBBb470b8)),
                          ),
                        ],
                      ),
                    );
                  }
                  if (message.username == 'Sistema') {
                    return Bubble(
                      margin: BubbleEdges.only(top: 8),
                      radius: Radius.circular(12),
                      alignment: Alignment.topLeft,
                      nip: BubbleNip.leftTop,
                      elevation: 2,
                      color: Colors.blue[400],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.username,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SelectableText(
                            message.message,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Bubble(
                      margin: BubbleEdges.only(top: 8),
                      radius: Radius.circular(12),
                      alignment: Alignment.topLeft,
                      nip: BubbleNip.leftTop,
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.username,
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xBBb470b8),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SelectableText(
                            message.message,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      focusNode: messageNode,
                      onFieldSubmitted: (val) {
                        sendMessage();
                      },
                      decoration: InputDecoration(
                        labelText: "Escribe algo...",
                        labelStyle: TextStyle(color: Color(0xBBb470b8)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xBBb470b8), width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xBBb470b8),
                            width: 2.0,
                          ),
                        ),
                      ),
                      controller: messageController,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 25.0,
                  color: Color(0xBBb470b8),
                  onPressed: () {
                    sendMessage();
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoChat extends StatelessWidget {
  final Comunidad comunidad;
  final List<String> conectados;

  InfoChat(this.comunidad, this.conectados);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(child: Text(conectados.toString())),
      ),
    );
  }
}
