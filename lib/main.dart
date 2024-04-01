import 'package:alindor_assessment/app/di.dart';
import 'package:alindor_assessment/presentation/records/records_viewmodel.dart';
import 'package:alindor_assessment/presentation/resources%20/theme_manager.dart';
import 'package:alindor_assessment/presentation/widgets/app_scroll_behavior.dart';
import 'package:alindor_assessment/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAppModule();
  await appLogic.bootstrap();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecordsViewModel()),
      ],
      child: MaterialApp.router(
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.routerDelegate,
        builder: (context, child) {
          return Theme(
              data: getApplicationTheme(),
              child: ScrollConfiguration(
                behavior: AppScrollBehavior(),
                child: child!,
              ));
        },
      ),
    );
  }
}
