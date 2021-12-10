import 'package:flutter_auth/models/models.dart';

User currentUser = User(
  id: '',
  username: '',
  password: '',
  email: '',
  nombre: '',
  edad: '',
  descripcion: '',
  imageUrl: '',
  puntuacion: 0,
);

final List<User> onlineUsers = [
  
  User(
   id: 'null',
  username: 'Raven',
  password: 'null',
  email: 'null',
  nombre: 'null',
  edad: 'null',
  descripcion: 'null',
  imageUrl: 'https://static3.lasprovincias.es/www/multimedia/202010/10/media/cortadas/gato-ksgH-U1204237773070s-1248x770@Las%20Provincias.jpg',
  puntuacion: 0,
  ),

  User(
  id: 'null',
  username: 'Barea',
  password: 'null',
  email: 'null',
  nombre: 'null',
  edad: 'null',
  descripcion: 'null',
  imageUrl: 'https://static3.lasprovincias.es/www/multimedia/202010/10/media/cortadas/gato-ksgH-U1204237773070s-1248x770@Las%20Provincias.jpg',
  puntuacion: 0,
  ),
];

final List<Post> posts = [
  
  Post(
    user: onlineUsers[1],
    caption: 'Hello world',
    timeAgo: '58m',
    imageUrl: 'https://images.unsplash.com/photo-1525253086316-d0c936c814f8',
    likes: 1202,
    comments: 184,
    shares: 96,
  ),

  Post(
    user: onlineUsers[0],
    caption: 'Recordad que la entrega del sprint 1 es el 10/12/2021',
    timeAgo: '1d',
    imageUrl: 'https://images.unsplash.com/photo-1525253086316-d0c936c814f8',
    likes: 20,
    comments: 10,
    shares: 2,
  ),

  Post(
    user: currentUser,
    caption: 'Ya podeis ver nuestros mockups! https://eagrup2.wordpress.com/2021/10/22/mockups-ready/',
    timeAgo: '55s',
    imageUrl: 'https://eagrup2.files.wordpress.com/2021/10/image-15.png',
    likes: 1500,
    comments: 542,
    shares: 641,
  ),

];