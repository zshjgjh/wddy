import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utilis/app_routers.dart';
import 'core/utilis/constants.dart';

import 'core/utilis/services/fire_base/fire_auth_service.dart';
import 'core/utilis/services/fire_base/fire_store_service.dart';
import 'core/utilis/services/supabase/subabase_data_base_service.dart';
import 'core/utilis/services/supabase/supabase_storage_service.dart';
import 'core/utilis/shared_prefrences.dart';
import 'core/utilis/styles.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/widgets/build_bottom_bar.dart';
import 'generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesSingelton.init(); //create instance from shared pref
  await Firebase.initializeApp();




  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabControllerProvider()),
      ],
      child: MultiBlocProvider(providers: [

      //  ChangeNotifierProvider(create: (_) => ThemeProvider()),

        //ChangeNotifierProvider(create: (_) => LanguageProvider()),


      ], child: const MyApp()),
    ),
  ) // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  //  return Consumer2<ThemeProvider, LanguageProvider>(
    //  builder: (context, themeProvider, languageProvider, child) {
        return MaterialApp.router(
          routerConfig: AppRouters.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(),
          darkTheme: ThemeData.dark().copyWith(),
         // themeMode: themeProvider.themeMode,
        //  locale: languageProvider.locale, // هنا نربط اللغة المختارة
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      }
  }


