import 'package:alindor_assessment/presentation/login/login_page.dart';
import 'package:alindor_assessment/presentation/recorder/recorder_page.dart';
import 'package:alindor_assessment/presentation/records/records_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPaths {
  static String recorder = "/recorder";
  static String analysis = "/analysis";
  static String login = "/login";
}

final appRouter = GoRouter(routes: [
  AppRoute(ScreenPaths.recorder, (s) => const RecorderPage()),
  AppRoute(ScreenPaths.analysis, (s) => const RecordsPage()),
  AppRoute(ScreenPaths.login, (s) => const LoginPage()),
]);

class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [],
        this.interaction = RouterInteraction.normal})
      : super(
    path: path,
    routes: routes,
    pageBuilder: (context, state) {
      final pageContent = Scaffold(
        body: builder(state),
        resizeToAvoidBottomInset: false,
      );
      if (interaction == RouterInteraction.slide) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: pageContent,
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      } else {
        return CupertinoPage(child: pageContent);
      }
    },
  );
  final RouterInteraction interaction;
}

enum RouterInteraction { slide, sheet, normal }