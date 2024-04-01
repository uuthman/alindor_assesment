import 'package:alindor_assessment/app/di.dart';
import 'package:alindor_assessment/data/datasource/user_storage.dart';
import 'package:alindor_assessment/firebase_options.dart';
import 'package:alindor_assessment/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';

class AppLogic {
  bool isBootstrapComplete = false;

  Future<void> bootstrap() async {
    bool isBootstrapComplete = false;
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final status = await Permission.microphone.status;

    if(status == PermissionStatus.denied) {
      await Permission.microphone.request();
    }



    isBootstrapComplete = true;
    final storage = instance<UserStorage>();
    final user =  await storage.getUser();

    if(user != null) {
      appRouter.go(ScreenPaths.recorder);
    } else {
      appRouter.go(ScreenPaths.login);
    }

  }
}