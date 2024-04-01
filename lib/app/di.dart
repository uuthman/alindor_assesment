import 'package:alindor_assessment/app/logic/app_logic.dart';
import 'package:alindor_assessment/core/firebase_service.dart';
import 'package:alindor_assessment/core/storage.dart';
import 'package:alindor_assessment/data/datasource/user_storage.dart';
import 'package:alindor_assessment/data/network/app_client.dart';
import 'package:alindor_assessment/data/network/dio_factory.dart';
import 'package:alindor_assessment/data/network/openai_client.dart';
import 'package:alindor_assessment/data/repository_impl/recorder_repository_impl.dart';
import 'package:alindor_assessment/domain/repository/recorder_repository.dart';
import 'package:alindor_assessment/presentation/login/cubit/login_cubit.dart';
import 'package:alindor_assessment/presentation/recorder/bloc/recorder_bloc.dart';
import 'package:alindor_assessment/presentation/resources%20/assets_manager.dart';
import 'package:alindor_assessment/presentation/resources%20/color_manager.dart';
import 'package:alindor_assessment/presentation/resources%20/font_manager.dart';
import 'package:alindor_assessment/presentation/resources%20/values_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await dotenv.load(fileName: ".env");
  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
  instance.registerLazySingleton<Storage>(() => Storage(secureStorage));
  instance.registerLazySingleton<FirebaseService>(
      () => FirebaseService(FirebaseAuth.instance));
  instance.registerLazySingleton<UserStorage>(() => UserStorage(instance()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  final dHeaders = {
    'Content-Type': 'audio/*',
    'Authorization': 'Token ${dotenv.env["DEEPGRAM_API"]}',
    'Accept': 'application/json'
  };
  final deepgramDio = await instance<DioFactory>().getDio(dHeaders);
  instance.registerLazySingleton<AppClient>(() => AppClient(deepgramDio));
  final oHeader = {
    "Content-Type": "application/json",
    "Authorization":
        "Bearer ${dotenv.env["OPENAIAPI"]}"
  };
  final openDio = await instance<DioFactory>().getDio(oHeader);
  instance.registerLazySingleton<OpenaiClient>(() => OpenaiClient(openDio));
  instance.registerLazySingleton<RecorderRepository>(
      () => RecorderRepositoryImpl(instance(), instance()));
  initBloc();
  initCubit();
  initResources();
  initLogic();
}

initResources() {
  instance.registerLazySingleton<ColorManager>(() => ColorManager());
  instance.registerLazySingleton<AppSize>(() => AppSize());
  instance.registerLazySingleton<AppMargin>(() => AppMargin());
  instance.registerLazySingleton<AppPadding>(() => AppPadding());
  instance.registerLazySingleton<AssetsManager>(() => AssetsManager());
  instance.registerLazySingleton<FontSize>(() => FontSize());
  instance.registerLazySingleton<FontWeightManager>(() => FontWeightManager());
}

initLogic() {
  instance.registerLazySingleton<AppLogic>(() => AppLogic());
}

initBloc() {
  instance.registerFactory<RecorderBloc>(
      () => RecorderBloc(instance(), instance(), instance()));
}

initCubit() {
  instance
      .registerFactory<LoginCubit>(() => LoginCubit(instance(), instance()));
}


ColorManager get $color => instance<ColorManager>();
AppSize get $size => instance<AppSize>();
AppMargin get $margin => instance<AppMargin>();
AppPadding get $padding => instance<AppPadding>();
AssetsManager get $asset => instance<AssetsManager>();
FontSize get $fontSize => instance<FontSize>();
FontWeightManager get $fontWeight => instance<FontWeightManager>();
AppLogic get appLogic => instance<AppLogic>();
