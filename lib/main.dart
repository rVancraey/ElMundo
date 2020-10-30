import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/food_catalog.dart';
import 'models/user.dart';
import 'screens/authentication/signin.dart';
import 'screens/authentication/signup.dart';
import 'screens/food_basket.dart';
import 'screens/food_categories.dart';
import 'screens/food_favorites.dart';
import 'screens/food_items.dart';
import 'screens/main_menu.dart';
import 'screens/wrapper.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
        ChangeNotifierProvider(
          create: (context) => FoodCatalog(),
        )
      ],
      child: MaterialApp(
        title: 'El Mundo',
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/food_categories': (context) => FoodCategories(),
          FoodItems.routeName: (context) => FoodItems(),
          '/signin': (context) => SignIn(),
          '/signup': (context) => SignUp(),
          '/main_menu': (context) => MainMenu(),
          '/food_basket': (context) => FoodBasket(),
          '/food_favorites': (context) => FoodFavorites()
        },
      ),
    );
  }
}
