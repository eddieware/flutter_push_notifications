import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

//exNbjwOPwBA:APA91bGert4DJLNuv21KM6vNu3geWEEQeTDQf-W5chgIfV-t0R46GLANnnbTXYiGiAGaDaE12RzuKQyM0d0Qyeb5NzmVpNTguM0SH3ozLSlHuErJWO2wosU4at59E-n0ye4tEr3ENXBJ

class PushNotificationsProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajesStream => _mensajesStreamController.stream;

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotifications() async {
    //proporcionar token

    await _firebaseMessaging
        .requestNotificationPermissions(); //habilitar permismos
    final token = await _firebaseMessaging.getToken();

    print('==== FCM Token ======');
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage:
          Platform.isIOS ? null : PushNotificationsProvider.onBackgroundMessage,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('====== onMessage ====== ');
    print('message: $message');
    // print('argumento: $argumento');

    final argumento = message['data']['comida'];

    print(argumento);

    // String argumento = 'no-data';

    // if (Platform.isAndroid) {
    //   argumento = message['data']['comida'] ?? 'no-data';
    // } else {
    //   argumento = message['comida'] ?? 'no-data';
    // }

    // _mensajesStreamController.sink.add(argumento);
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
