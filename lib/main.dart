import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'api/firebase_api.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';
import 'pages/notification_page.dart';

// 8:15:54

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseApi firebaseApi = FirebaseApi(); // Create an instance of FirebaseApi
  await firebaseApi
      .initNotifications(); // Call initNotifications on the instance

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_page': (context) => const NotificationPage(),
      },
    );
  }
}
