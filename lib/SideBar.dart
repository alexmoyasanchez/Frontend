import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ComunidadesList/comunidadeslist_screen.dart';
import 'package:flutter_auth/Screens/UserList/UserList_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/components/profile_avatar.dart';
import 'package:flutter_auth/Screens/EditPerfil/editperfil_screen.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/Screens/BarList/barlist_screen.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(currentUser.username),
              accountEmail: Text(currentUser.email),
              currentAccountPicture:
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage (currentUser.imageUrl),
                  ),
              decoration: BoxDecoration(
                  color: Colors.pink[300],
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://png.pngtree.com/background/20210717/original/pngtree-purple-bright-watercolor-background-picture-image_1432727.jpg',
                    ),
                    fit: BoxFit.cover,
                  ))),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Inicio'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Busqueda'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.local_bar),
            title: Text('Lista de locales'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaBaresScreen();
              }),
            ),
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text('Comunidades'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaComunidadesScreen();
              }),
            ),
          ),
          ListTile(
              leading: Icon(Icons.chat_bubble),
              title: Text('Chats de comunidad'),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                  color: Colors.redAccent[700],
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text('3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )),
                  ),
                ),
              )),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Locales favoritos'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.vpn_key_rounded),
            title: Text('Mis bares'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.local_attraction_rounded),
            title: Text('Mis cupones'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.emoji_events_rounded),
            title: Text('Ranking'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaUsuariosScreen();
              }),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Editar Perfil'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return EditPerfilScreen();
              }),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings_sharp),
            title: Text('Configuración'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Sobre nosotros'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar Sesión'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return WelcomeScreen();
              }),
            ),
          ),
        ],
      ),
      //backgroundColor: Color(0xFFEDF6E5),
    );
  }
}
