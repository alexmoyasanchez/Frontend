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


String currentPhoto = " ";
String motivo, icono1 = 'assets/images/mujer.png', icono2 = 'assets/images/pride.png', icono3 = 'assets/images/black.png', icono4 = 'assets/images/otro.png';
String icono5 = 'assets/images/usuario.png', icono6 = 'assets/images/comunidad.png', icono7 = 'assets/images/bar.png';
String bbar, busuario, bcomunidad;


  bool buscaBar = false, buscaComunidad = false, buscaUsuario = true;

const APP_ID = "069b353ebf464a92b92accd413b58fb7";
const Token = "006069b353ebf464a92b92accd413b58fb7IADZQhkR+v72RfJfBzvWNuzMwJ7Qlvp8Zd1DJyGEhKOLVkO+t+gAAAAAEACBVNzppPveYQEAAQCk+95h";


double numusuarios = 0.0, numbares = 0.0, numcomunidades = 0.0;
String idDenuncia;