import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learngin/providers/favourites_providers.dart';
import 'package:learngin/providers/privacy_policy.dart';
import 'package:learngin/providers/quotes_providers.dart';
import 'package:learngin/providers/rating_providers.dart';
import 'package:learngin/providers/splashscreen_provider.dart';
import 'package:learngin/view/pages/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashscreenProvider()),
        ChangeNotifierProvider(create: (_) => QuotesProviders()),
        ChangeNotifierProvider(create: (_) => FavouritesProviders()),
        ChangeNotifierProvider(create: (_) => RatingProvider()),
        ChangeNotifierProvider(create: (_) => PrivacyPolicyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quotes',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: textTheme,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
