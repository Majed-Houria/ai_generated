import 'package:ai_generated/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/asset_paths.dart';
import 'di/dependency_injection.dart';
import 'home_screen.dart';
import 'localization/localization_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalizationService.initLocalization();
  await setupGetIt();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationService.supportedLocales,
      path: AssetPaths.translationsPath,
      saveLocale: true,
      fallbackLocale: LocalizationService.arLocale, /// language
      child: MyApp(appRouter: AppRouter()),
    ),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874), /// responsive
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: widget.appRouter.generateRoute,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,

          locale: context.locale,
          home: HomeScreen(),
        ),
    );
  }
}
/// flutter build apk --release