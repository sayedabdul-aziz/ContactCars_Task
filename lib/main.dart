import 'package:contactcars_task/core/theme/theme_config.dart';
import 'package:contactcars_task/core/utils/app_router.dart';
import 'package:contactcars_task/core/utils/service_locater/service_locater.dart'
    as di;
import 'package:contactcars_task/features/movie/presentation/manager/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupServiceLocater();

  runApp(BlocProvider(
    create: (context) => MovieCubit(
      moviesRepo: di.sl(),
    ),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemeData.darkTheme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
