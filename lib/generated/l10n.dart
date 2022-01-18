// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `WELCOME TO BAREA`
  String get bienvenida {
    return Intl.message(
      'WELCOME TO BAREA',
      name: 'bienvenida',
      desc: '',
      args: [],
    );
  }

  /// `LOG IN`
  String get iniciar {
    return Intl.message(
      'LOG IN',
      name: 'iniciar',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get registrar {
    return Intl.message(
      'SIGN UP',
      name: 'registrar',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get registro {
    return Intl.message(
      'SIGN UP',
      name: 'registro',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get correo {
    return Intl.message(
      'Email',
      name: 'correo',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pass {
    return Intl.message(
      'Password',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get pass2 {
    return Intl.message(
      'Repeat Password',
      name: 'pass2',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account? `
  String get account {
    return Intl.message(
      'Do you have an account? ',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get registrate {
    return Intl.message(
      'Sign Up',
      name: 'registrate',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get inicia {
    return Intl.message(
      'Log In',
      name: 'inicia',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get o {
    return Intl.message(
      'OR',
      name: 'o',
      desc: '',
      args: [],
    );
  }

  /// `Do not you have an account yet? `
  String get cuenta {
    return Intl.message(
      'Do not you have an account yet? ',
      name: 'cuenta',
      desc: '',
      args: [],
    );
  }

  /// `What's happening in your local? `
  String get post {
    return Intl.message(
      'What\'s happening in your local? ',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get foto {
    return Intl.message(
      'Photo',
      name: 'foto',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get fav {
    return Intl.message(
      'Favorite',
      name: 'fav',
      desc: '',
      args: [],
    );
  }

  /// ` Favorites`
  String get favs {
    return Intl.message(
      ' Favorites',
      name: 'favs',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get inicio {
    return Intl.message(
      'Home',
      name: 'inicio',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get buscar {
    return Intl.message(
      'Search',
      name: 'buscar',
      desc: '',
      args: [],
    );
  }

  /// `List of Locals`
  String get locales {
    return Intl.message(
      'List of Locals',
      name: 'locales',
      desc: '',
      args: [],
    );
  }

  /// `Communities`
  String get comunidades {
    return Intl.message(
      'Communities',
      name: 'comunidades',
      desc: '',
      args: [],
    );
  }

  /// `Communities chats`
  String get chats {
    return Intl.message(
      'Communities chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `Favourites locals`
  String get localesfavs {
    return Intl.message(
      'Favourites locals',
      name: 'localesfavs',
      desc: '',
      args: [],
    );
  }

  /// `My locals`
  String get bares {
    return Intl.message(
      'My locals',
      name: 'bares',
      desc: '',
      args: [],
    );
  }

  /// `My Badges`
  String get cupones {
    return Intl.message(
      'My Badges',
      name: 'cupones',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get perfil {
    return Intl.message(
      'Edit profile',
      name: 'perfil',
      desc: '',
      args: [],
    );
  }

  /// `Video call`
  String get config {
    return Intl.message(
      'Video call',
      name: 'config',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get estadisticas {
    return Intl.message(
      'Statistics',
      name: 'estadisticas',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get cerrar {
    return Intl.message(
      'Log Out',
      name: 'cerrar',
      desc: '',
      args: [],
    );
  }

  /// `Locals List`
  String get listabares {
    return Intl.message(
      'Locals List',
      name: 'listabares',
      desc: '',
      args: [],
    );
  }

  /// `The last agression at this local was: `
  String get lastagresion {
    return Intl.message(
      'The last agression at this local was: ',
      name: 'lastagresion',
      desc: '',
      args: [],
    );
  }

  /// `Local name: `
  String get nombrel {
    return Intl.message(
      'Local name: ',
      name: 'nombrel',
      desc: '',
      args: [],
    );
  }

  /// `Address: `
  String get direccion {
    return Intl.message(
      'Address: ',
      name: 'direccion',
      desc: '',
      args: [],
    );
  }

  /// `Ambient music: `
  String get musica {
    return Intl.message(
      'Ambient music: ',
      name: 'musica',
      desc: '',
      args: [],
    );
  }

  /// `Local owner: `
  String get owner {
    return Intl.message(
      'Local owner: ',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Capacity: `
  String get aforo {
    return Intl.message(
      'Capacity: ',
      name: 'aforo',
      desc: '',
      args: [],
    );
  }

  /// `Maximum capacity: `
  String get aforomax {
    return Intl.message(
      'Maximum capacity: ',
      name: 'aforomax',
      desc: '',
      args: [],
    );
  }

  /// `Schedule: `
  String get horario {
    return Intl.message(
      'Schedule: ',
      name: 'horario',
      desc: '',
      args: [],
    );
  }

  /// `Description: `
  String get descripcion {
    return Intl.message(
      'Description: ',
      name: 'descripcion',
      desc: '',
      args: [],
    );
  }

  /// `NOTIFY AGRESSION`
  String get notagresion {
    return Intl.message(
      'NOTIFY AGRESSION',
      name: 'notagresion',
      desc: '',
      args: [],
    );
  }

  /// `Comunities List`
  String get listac {
    return Intl.message(
      'Comunities List',
      name: 'listac',
      desc: '',
      args: [],
    );
  }

  /// `Comunity name`
  String get nombrec {
    return Intl.message(
      'Comunity name',
      name: 'nombrec',
      desc: '',
      args: [],
    );
  }

  /// `Adminstrator`
  String get administrador {
    return Intl.message(
      'Adminstrator',
      name: 'administrador',
      desc: '',
      args: [],
    );
  }

  /// `JOIN TO THIS COMMUNITY`
  String get unirme {
    return Intl.message(
      'JOIN TO THIS COMMUNITY',
      name: 'unirme',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nombre {
    return Intl.message(
      'Name',
      name: 'nombre',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get edad {
    return Intl.message(
      'Date of birth',
      name: 'edad',
      desc: '',
      args: [],
    );
  }

  /// `Score`
  String get puntuacion {
    return Intl.message(
      'Score',
      name: 'puntuacion',
      desc: '',
      args: [],
    );
  }

  /// `EDIT PROFILE`
  String get editar {
    return Intl.message(
      'EDIT PROFILE',
      name: 'editar',
      desc: '',
      args: [],
    );
  }

  /// `Email: `
  String get correo2 {
    return Intl.message(
      'Email: ',
      name: 'correo2',
      desc: '',
      args: [],
    );
  }

  /// `Username: `
  String get username2 {
    return Intl.message(
      'Username: ',
      name: 'username2',
      desc: '',
      args: [],
    );
  }

  /// `Password: `
  String get pass3 {
    return Intl.message(
      'Password: ',
      name: 'pass3',
      desc: '',
      args: [],
    );
  }

  /// `Name: `
  String get nombre2 {
    return Intl.message(
      'Name: ',
      name: 'nombre2',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth: `
  String get edad2 {
    return Intl.message(
      'Date of birth: ',
      name: 'edad2',
      desc: '',
      args: [],
    );
  }

  /// `Description: `
  String get descripcion2 {
    return Intl.message(
      'Description: ',
      name: 'descripcion2',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get wrongp {
    return Intl.message(
      'Passwords do not match',
      name: 'wrongp',
      desc: '',
      args: [],
    );
  }

  /// `Wrong email format`
  String get wrongc {
    return Intl.message(
      'Wrong email format',
      name: 'wrongc',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Missing fields to fill`
  String get campos {
    return Intl.message(
      'Missing fields to fill',
      name: 'campos',
      desc: '',
      args: [],
    );
  }

  /// `Failed to register user`
  String get wrongu {
    return Intl.message(
      'Failed to register user',
      name: 'wrongu',
      desc: '',
      args: [],
    );
  }

  /// `Score: `
  String get puntuacion2 {
    return Intl.message(
      'Score: ',
      name: 'puntuacion2',
      desc: '',
      args: [],
    );
  }

  /// `CREATE LOCAL`
  String get crearl {
    return Intl.message(
      'CREATE LOCAL',
      name: 'crearl',
      desc: '',
      args: [],
    );
  }

  /// `New Local`
  String get nuevol {
    return Intl.message(
      'New Local',
      name: 'nuevol',
      desc: '',
      args: [],
    );
  }

  /// `EDIT LOCAL`
  String get editarl {
    return Intl.message(
      'EDIT LOCAL',
      name: 'editarl',
      desc: '',
      args: [],
    );
  }

  /// `Modify capacity and add valoration`
  String get modificaraforo {
    return Intl.message(
      'Modify capacity and add valoration',
      name: 'modificaraforo',
      desc: '',
      args: [],
    );
  }

  /// `EDIT CAPACITY`
  String get editara {
    return Intl.message(
      'EDIT CAPACITY',
      name: 'editara',
      desc: '',
      args: [],
    );
  }

  /// ` people`
  String get personas {
    return Intl.message(
      ' people',
      name: 'personas',
      desc: '',
      args: [],
    );
  }

  /// `New Comunity`
  String get nuevac {
    return Intl.message(
      'New Comunity',
      name: 'nuevac',
      desc: '',
      args: [],
    );
  }

  /// `CREATE COMUNITY`
  String get crearc {
    return Intl.message(
      'CREATE COMUNITY',
      name: 'crearc',
      desc: '',
      args: [],
    );
  }

  /// `Owner: `
  String get ownerc {
    return Intl.message(
      'Owner: ',
      name: 'ownerc',
      desc: '',
      args: [],
    );
  }

  /// `PUBLISH POST`
  String get crearp {
    return Intl.message(
      'PUBLISH POST',
      name: 'crearp',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get dia {
    return Intl.message(
      'day',
      name: 'dia',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get dias {
    return Intl.message(
      'days',
      name: 'dias',
      desc: '',
      args: [],
    );
  }

  /// `hour`
  String get hora {
    return Intl.message(
      'hour',
      name: 'hora',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get horas {
    return Intl.message(
      'hours',
      name: 'horas',
      desc: '',
      args: [],
    );
  }

  /// `minute`
  String get minuto {
    return Intl.message(
      'minute',
      name: 'minuto',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutos {
    return Intl.message(
      'minutes',
      name: 'minutos',
      desc: '',
      args: [],
    );
  }

  /// `year`
  String get year {
    return Intl.message(
      'year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `years`
  String get years {
    return Intl.message(
      'years',
      name: 'years',
      desc: '',
      args: [],
    );
  }

  /// `month`
  String get mes {
    return Intl.message(
      'month',
      name: 'mes',
      desc: '',
      args: [],
    );
  }

  /// `months`
  String get meses {
    return Intl.message(
      'months',
      name: 'meses',
      desc: '',
      args: [],
    );
  }

  /// `week`
  String get semana {
    return Intl.message(
      'week',
      name: 'semana',
      desc: '',
      args: [],
    );
  }

  /// `weeks`
  String get semanas {
    return Intl.message(
      'weeks',
      name: 'semanas',
      desc: '',
      args: [],
    );
  }

  /// `just now`
  String get ahora {
    return Intl.message(
      'just now',
      name: 'ahora',
      desc: '',
      args: [],
    );
  }

  /// ` ago `
  String get atras {
    return Intl.message(
      ' ago ',
      name: 'atras',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get hace {
    return Intl.message(
      '',
      name: 'hace',
      desc: '',
      args: [],
    );
  }

  /// `My maps`
  String get mapas {
    return Intl.message(
      'My maps',
      name: 'mapas',
      desc: '',
      args: [],
    );
  }

  /// `never`
  String get noagresion {
    return Intl.message(
      'never',
      name: 'noagresion',
      desc: '',
      args: [],
    );
  }

  /// `Caution!`
  String get atencion {
    return Intl.message(
      'Caution!',
      name: 'atencion',
      desc: '',
      args: [],
    );
  }

  /// `Where do you want to select the image from?`
  String get seleccionFoto {
    return Intl.message(
      'Where do you want to select the image from?',
      name: 'seleccionFoto',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get galeria {
    return Intl.message(
      'Gallery',
      name: 'galeria',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camara {
    return Intl.message(
      'Camera',
      name: 'camara',
      desc: '',
      args: [],
    );
  }

  /// `EDIT COMUNITY`
  String get editarC {
    return Intl.message(
      'EDIT COMUNITY',
      name: 'editarC',
      desc: '',
      args: [],
    );
  }

  /// `Edit Comunity`
  String get editC {
    return Intl.message(
      'Edit Comunity',
      name: 'editC',
      desc: '',
      args: [],
    );
  }

  /// `My Comunities`
  String get miscomunidades {
    return Intl.message(
      'My Comunities',
      name: 'miscomunidades',
      desc: '',
      args: [],
    );
  }

  /// `DELETE COMUNITY`
  String get eliminarc {
    return Intl.message(
      'DELETE COMUNITY',
      name: 'eliminarc',
      desc: '',
      args: [],
    );
  }

  /// `DELETE LOCAL`
  String get eliminarl {
    return Intl.message(
      'DELETE LOCAL',
      name: 'eliminarl',
      desc: '',
      args: [],
    );
  }

  /// `My Badges`
  String get insignias {
    return Intl.message(
      'My Badges',
      name: 'insignias',
      desc: '',
      args: [],
    );
  }

  /// `Motive for the assault: `
  String get motivo {
    return Intl.message(
      'Motive for the assault: ',
      name: 'motivo',
      desc: '',
      args: [],
    );
  }

  /// `Description of the assault: `
  String get descripciona {
    return Intl.message(
      'Description of the assault: ',
      name: 'descripciona',
      desc: '',
      args: [],
    );
  }

  /// `Solution by the local: `
  String get solucion {
    return Intl.message(
      'Solution by the local: ',
      name: 'solucion',
      desc: '',
      args: [],
    );
  }

  /// `ADD INFORMATION`
  String get info {
    return Intl.message(
      'ADD INFORMATION',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Male chauvinist`
  String get machista {
    return Intl.message(
      'Male chauvinist',
      name: 'machista',
      desc: '',
      args: [],
    );
  }

  /// `LGTBIQ+phobic`
  String get LGTBIQ {
    return Intl.message(
      'LGTBIQ+phobic',
      name: 'LGTBIQ',
      desc: '',
      args: [],
    );
  }

  /// `Racist`
  String get racista {
    return Intl.message(
      'Racist',
      name: 'racista',
      desc: '',
      args: [],
    );
  }

  /// `Add information about agression`
  String get infoagresion {
    return Intl.message(
      'Add information about agression',
      name: 'infoagresion',
      desc: '',
      args: [],
    );
  }

  /// `Agression`
  String get agresion {
    return Intl.message(
      'Agression',
      name: 'agresion',
      desc: '',
      args: [],
    );
  }

  /// `Another`
  String get otro {
    return Intl.message(
      'Another',
      name: 'otro',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get nouser {
    return Intl.message(
      'User not found',
      name: 'nouser',
      desc: '',
      args: [],
    );
  }

  /// `Number of users at the comunnity `
  String get nusuarios {
    return Intl.message(
      'Number of users at the comunnity ',
      name: 'nusuarios',
      desc: '',
      args: [],
    );
  }

  /// `Report post`
  String get denuncia {
    return Intl.message(
      'Report post',
      name: 'denuncia',
      desc: '',
      args: [],
    );
  }

  /// `Report an issue`
  String get titulodenuncia {
    return Intl.message(
      'Report an issue',
      name: 'titulodenuncia',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for reporting`
  String get mensajedenuncia {
    return Intl.message(
      'Thanks for reporting',
      name: 'mensajedenuncia',
      desc: '',
      args: [],
    );
  }

  /// `It's suspicious or spam`
  String get desc1 {
    return Intl.message(
      'It\'s suspicious or spam',
      name: 'desc1',
      desc: '',
      args: [],
    );
  }

  /// `It displays a sensitive photo or video`
  String get desc2 {
    return Intl.message(
      'It displays a sensitive photo or video',
      name: 'desc2',
      desc: '',
      args: [],
    );
  }

  /// `It's abusive or harmful`
  String get desc3 {
    return Intl.message(
      'It\'s abusive or harmful',
      name: 'desc3',
      desc: '',
      args: [],
    );
  }

  /// `It expesses intentions oof selh-harm or suicide`
  String get desc4 {
    return Intl.message(
      'It expesses intentions oof selh-harm or suicide',
      name: 'desc4',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get usuariosestadistica {
    return Intl.message(
      'Users',
      name: 'usuariosestadistica',
      desc: '',
      args: [],
    );
  }

  /// `Locals`
  String get baresestadistica {
    return Intl.message(
      'Locals',
      name: 'baresestadistica',
      desc: '',
      args: [],
    );
  }

  /// `Communities`
  String get comunidadesestadistica {
    return Intl.message(
      'Communities',
      name: 'comunidadesestadistica',
      desc: '',
      args: [],
    );
  }

  /// `SITUATE LOCAL AT MAP`
  String get localizarl {
    return Intl.message(
      'SITUATE LOCAL AT MAP',
      name: 'localizarl',
      desc: '',
      args: [],
    );
  }

  /// `Rate your experience`
  String get valorar {
    return Intl.message(
      'Rate your experience',
      name: 'valorar',
      desc: '',
      args: [],
    );
  }

  /// `Horrible`
  String get horrible {
    return Intl.message(
      'Horrible',
      name: 'horrible',
      desc: '',
      args: [],
    );
  }

  /// `Bad`
  String get mala {
    return Intl.message(
      'Bad',
      name: 'mala',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get normal {
    return Intl.message(
      'Normal',
      name: 'normal',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get buena {
    return Intl.message(
      'Good',
      name: 'buena',
      desc: '',
      args: [],
    );
  }

  /// `Will return`
  String get volveremos {
    return Intl.message(
      'Will return',
      name: 'volveremos',
      desc: '',
      args: [],
    );
  }

  /// `Introduce your rating`
  String get introduceop {
    return Intl.message(
      'Introduce your rating',
      name: 'introduceop',
      desc: '',
      args: [],
    );
  }

  /// `SEND YOUR RATING`
  String get enviarop {
    return Intl.message(
      'SEND YOUR RATING',
      name: 'enviarop',
      desc: '',
      args: [],
    );
  }

  /// `See ratings`
  String get verval {
    return Intl.message(
      'See ratings',
      name: 'verval',
      desc: '',
      args: [],
    );
  }

  /// `You are not the user who posted the rating and you cannot delete it.`
  String get incorrectuser {
    return Intl.message(
      'You are not the user who posted the rating and you cannot delete it.',
      name: 'incorrectuser',
      desc: '',
      args: [],
    );
  }

  /// `Valoraciones`
  String get valoracion {
    return Intl.message(
      'Valoraciones',
      name: 'valoracion',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'ES'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}