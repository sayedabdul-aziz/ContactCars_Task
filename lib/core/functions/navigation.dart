import 'package:contactcars_task/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

void pushNamedAndRemoveUntil(String name) {
  GoRouter router = AppRouter.router;
  while (router.canPop()) {
    router.pop();
  }
  router.pushReplacement(name);
}
