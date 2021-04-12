import 'package:customer_app/abstracts/theme/ez_themes.dart';
import 'package:customer_app/constants.dart';
import 'package:customer_app/models/currentBottomNavigationIndex.dart';
import 'package:customer_app/models/productList.dart';
import 'package:customer_app/models/user.dart';
import 'package:customer_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
              title: 'Loading'
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(
                  value: CurrentBottomNavigation(0)
              ),
              ChangeNotifierProvider.value(
                  value: ProductList([])
              ),
              ChangeNotifierProvider.value(
                  value: User()
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: EzTheme,

              initialRoute: '/welcome',
              routes: routes,
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          title: 'Loading'
        );
      }
    );
  }
}


