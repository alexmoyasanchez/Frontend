import 'package:flutter_auth/data/data.dart';
import 'models.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  //Los parametros para dar like y vistos en los mensajes no estan implementados
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

//Usuario que utiliza la app
final User usuario = User(
    id: currentUser.id,
    username: currentUser.username,
    imageUrl: currentUser.imageUrl,
    password: currentUser.password,
    descripcion: currentUser.descripcion,
    puntuacion: currentUser.puntuacion,
    name: currentUser.name,
    edad: currentUser.edad,
    email: currentUser.email);

//Chats de prueba
final User oscar = User(
    id: '1',
    username: "oscar08850",
    password: "45654",
    email: "asdfa@gmail.com",
    name: "oscar",
    edad: "24",
    descripcion: "holahola",
    imageUrl: currentUser.imageUrl,
    puntuacion: "4");
//Chats de ejemplo
List<Message> chats = [
  Message(sender: oscar, time: '5:30 PM', text: 'Que pasa peñita')
];

//Mensajes dentro del chat de ejemplo
List<Message> messages = [
  Message(
      sender: oscar,
      time: '5:30 PM',
      text: 'Que pasa peñita',
      isLiked: true,
      unread: true),
  Message(
      sender: currentUser,
      time: '4:30 PM',
      text: 'Oye cuando se sale?',
      isLiked: false,
      unread: true),
  Message(
      sender: oscar,
      time: '3:45 PM',
      text: 'Un porquito de test',
      isLiked: false,
      unread: true),
  Message(
      sender: oscar,
      time: '3:15 PM',
      text: 'Oleee que bien',
      isLiked: true,
      unread: true),
  Message(
      sender: currentUser,
      time: '2:30 PM',
      text: 'Hola se me oye???',
      isLiked: false,
      unread: true),
  Message(
      sender: oscar,
      time: '2:00 PM',
      text: 'Ojala funcionesss',
      isLiked: false,
      unread: true),
];
