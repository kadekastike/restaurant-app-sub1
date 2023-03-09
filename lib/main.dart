import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/list_restaurant.dart';
import 'package:restaurant_app/screen/restaurant_detail.dart';
import 'package:restaurant_app/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        RestaurantListScreen.routeName: (context) => const RestaurantListScreen(),
        RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(restaurantElement: ModalRoute.of(context)?.settings.arguments as dynamic)
      },
    );
  }
}
