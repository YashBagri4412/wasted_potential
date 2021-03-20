import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savdhaan_app/provider/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:savdhaan_app/provider/geolocator_provider.dart';
import 'package:savdhaan_app/provider/google_map_provider.dart';
import 'package:savdhaan_app/screens/auth_screen.dart';
//Relative Imports
import 'widget/permission_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GeoLocatorProvider(),
        ),
        ChangeNotifierProvider.value(
          value: GoogleMapProvider(),
        ),
        ChangeNotifierProvider.value(
          value: AuthenticationFirebase(),
        ),
      ],
      child: MaterialApp(
        title: 'Savdhaan App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: GoogleFonts.openSans(),
            headline3: GoogleFonts.openSans(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.black87,
            ),
            headline6: GoogleFonts.openSans(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            subtitle1: GoogleFonts.openSans(
              color: Colors.black54,
            ),
            caption: GoogleFonts.openSans(),
          ),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (_, userSnapShot) {
            if (userSnapShot.hasError) {
              print(userSnapShot.error.toString);
            }
            if (userSnapShot.data == null) {
              return AuthScreen();
            }
            print(userSnapShot.data);
            return PermissionSelector();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
