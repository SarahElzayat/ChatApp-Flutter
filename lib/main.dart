import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:max_firebase/screens/auth_screen.dart';
import 'package:max_firebase/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   // await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Chat',
        theme: ThemeData(
          // primarySwatch: Colors.pink,
          primarySwatch: generateMaterialColor(color: Color.fromARGB(225, 35, 63, 139)),
          backgroundColor: generateMaterialColor(color: Color(0xffE3E8F8)),
          
          // ignore: deprecated_member_use
          accentColor: Colors.deepPurple,
          // ignore: deprecated_member_use
          accentColorBrightness: Brightness.dark,
          textTheme: TextTheme(

            bodyText1: TextStyle(fontSize: 14, color: Colors.white,
            fontWeight: FontWeight.bold),

            // bodyLarge: TextStyle(),
            headline1: TextStyle(fontSize: 19, color: Color.fromARGB(255, 255, 255, 255) ,
          //  fontWeight: FontWeight.w500
          fontWeight: FontWeight.normal
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: generateMaterialColor(color: Color(0xffE4B7A0)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) return ChatScreen();
            return AuthScreen();
          }),
        ));
  }
}
