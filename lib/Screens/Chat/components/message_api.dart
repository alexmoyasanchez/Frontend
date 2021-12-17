import 'dart:convert';

import 'package:flutter_auth/models/message_model.dart';

class MessageApi {
  static get http => null;

  static Future<List<Message>> getMessages() async {
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
}
