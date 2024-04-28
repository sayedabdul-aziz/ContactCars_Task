import 'package:flutter/material.dart';

// app name
const String appName = "ContactCars";

//* For  app logic:
GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

//*For App theme
// Theme
const String kIsDark = "isDark";

//* Constants for Core, ex: ApiService, etc...
const String kLocale = "locale";
const String kUserToken = "UserToken";
const String kMoviesBox = "MoviesBox";
//Validators:
const emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
RegExp passwordRegex = RegExp(
  r'^(?=.*[a-z])' // At least one lowercase letter
  r'(?=.*[A-Z])' // At least one uppercase letter
  r'(?=.*\d)' // At least one digit
  r'(?=.*[\W_])' // At least one special character (symbol)
  r'.{8,}', // Minimum length of 8 characters
);
//*API Services:
const String kBaseUrl = "https://api.themoviedb.org/3";
const String kApiKey =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NDUzZmQxYjIxYWNkNTUwYzY3OTU2NTdlN2U4OGE5OSIsInN1YiI6IjY2MmUwZTg5MDNiZjg0MDEyNWVhYzUzOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LyV3zQxIxrRV-kLJuCfDryKH3JPVhJ8mq9tpzGCBjU8";
const Duration kOtpTimeout = Duration(seconds: 60);
