import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ComunidadesList/comunidadeslist_screen.dart';
import 'package:flutter_auth/Screens/Feed/feed_screen.dart';
import 'package:flutter_auth/Screens/MisBares/misbares_screen.dart';
import 'package:flutter_auth/Screens/UserList/UserList_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/EditPerfil/editperfil_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/Screens/BarList/barlist_screen.dart';

import 'generated/l10n.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              margin: const EdgeInsets.only(bottom: 0.0),
              accountName: Text(currentUser.username),
              accountEmail: Text(currentUser.email),
              currentAccountPicture: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(currentUser.imageUrl),
              ),
              decoration: BoxDecoration(
                color: PrimaryColor,
              )),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.home_filled, color: Colors.white,),
            title: Text(S.current.inicio, style: TextStyle(color: Colors.white),),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FeedScreen();
              }),
            ),
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.search, color: Colors.white,),
            title: Text(S.current.buscar, style: TextStyle(color: Colors.white),),
            onTap: () => null,
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.local_bar, color: Colors.white,),
            title: Text(S.current.locales, style: TextStyle(color: Colors.white),),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaBaresScreen();
              }),
            ),
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.people_alt, color: Colors.white,),
            title: Text(S.current.comunidades, style: TextStyle(color: Colors.white),),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaComunidadesScreen();
              }),
            ),
          ),
          ListTile(
            tileColor: Colors.black,
              leading: Icon(Icons.chat_bubble, color: Colors.white,),
              title: Text(S.current.chats, style: TextStyle(color: Colors.white),),
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
            tileColor: Colors.black,
            leading: Icon(Icons.favorite, color: Colors.white,),
            title: Text(S.current.localesfavs, style: TextStyle(color: Colors.white),),
            onTap: () => null,
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.vpn_key_rounded, color: Colors.white,),
            title: Text(S.current.bares, style: TextStyle(color: Colors.white),),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MisBaresScreen();
              }),
            ),
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.local_attraction_rounded, color: Colors.white,),
            title: Text(S.current.cupones, style: TextStyle(color: Colors.white),),
            onTap: () => null,
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.emoji_events_rounded, color: Colors.white,),
            title: Text('Ranking', style: TextStyle(color: Colors.white),),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaUsuariosScreen();
              }),
            ),
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.account_circle_rounded, color: Colors.white,),
            title: Text(S.current.perfil, style: TextStyle(color: Colors.white),),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return EditPerfilScreen();
              }),
            ),
          ),
          Divider(
            height: 0.1,
            thickness: 2.0,
            color: Colors.white,
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(
              Icons.settings_sharp,
              color: Colors.white,
            ),
            title: Text(
              S.current.config,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => null,
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.info_outline, color: Colors.white),
            title: Text(S.current.about, style: TextStyle(color: Colors.white)),
            onTap: () => null,
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.exit_to_app, color: Colors.white,),
            title: Text(S.current.cerrar, style: TextStyle(color: Colors.white),),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return WelcomeScreen();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
