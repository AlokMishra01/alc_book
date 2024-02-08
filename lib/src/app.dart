import 'package:alc_book/src/categories/categories_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings/settings_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
    required this.firstTime,
  }) : super(key: key);

  final SettingsController settingsController;
  final bool firstTime;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                restorationScopeId: 'app',
                // localizationsDelegates: const [
                //   AppLocalizations.delegate,
                //   GlobalMaterialLocalizations.delegate,
                //   GlobalWidgetsLocalizations.delegate,
                //   GlobalCupertinoLocalizations.delegate,
                // ],
                // supportedLocales: const [
                //   Locale('en', ''), // English, no country code
                // ],
                // locale: const Locale('en', ''),
                // onGenerateTitle: (BuildContext context) =>
                //     AppLocalizations.of(context)!.appTitle,
                theme: ThemeData(
                  textTheme: GoogleFonts.ralewayTextTheme(
                    Theme.of(context).textTheme,
                  ),
                  useMaterial3: true,
                ),
                // darkTheme: ThemeData.dark(),
                // themeMode: settingsController.themeMode,
                // themeMode: settingsController.themeMode,

                home: const CategoriesNew(),
              );
            });
      },
    );
  }
}
