import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';

class SideBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Àlex Moya'), 
            accountEmail: Text('alex.moya.i@estudiantat.upc.edu'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/logo_verde.png",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                )
              )
            ),
            decoration: BoxDecoration(
              color: Colors.pink[300],
              image: DecorationImage(
                image: NetworkImage(
                  'https://png.pngtree.com/background/20210717/original/pngtree-purple-bright-watercolor-background-picture-image_1432727.jpg',
                ),
                fit: BoxFit.cover,
              )
            )
          ),
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
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text('Amigos'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('Chat de grupo'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
              color: Colors.redAccent[700],
              width: 20,
              height: 20,
              child: Center(              
                child: Text(
                  '3', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )
                ),
              ),
            ),
          )
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Locales favoritos'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.local_attraction_rounded),
            title: Text('Mis cupones'),
            onTap: () => null,
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
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    }
                  ),
            ),
          ),
        ],
      ),
      //backgroundColor: Color(0xFFEDF6E5),
    );
  }
}

