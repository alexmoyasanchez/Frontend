import 'package:flutter_auth/models/models.dart';

User currentUser = User(
  id: null,
  username: 'Alex',
  password: null,
  email: null,
  imageUrl: 'https://fotos02.noticiasdenavarra.com/2020/06/08/690x278/gato.jpg',
);

final List<User> onlineUsers = [
  
  User(
    id: null,
    username: 'Toni',
    password: null,
    email: null,
    imageUrl: 'https://recerca.upc.edu/bampla/en/Personnel/staff_members/Oller-Antoni/2008-01-08.4864239201/@@images/23e43284-a97f-438f-a214-cdf3a87b97b8.jpeg',
  ),

  User(
    id: null,
    username: 'Barea',
    password: null,
    email: null,
    imageUrl: '',
  ),
];

final List<Post> posts = [
  
  Post(
    user: currentUser,
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
    imageUrl: null,
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