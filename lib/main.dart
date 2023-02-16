import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:migacy_app/persentation/page/splash_view/splash_screen.dart';
import 'package:migacy_app/resources/app_themes/app_themes.dart';
import 'package:migacy_app/resources/configs/routes/routes.dart';
import 'package:migacy_app/resources/configs/service_locator/service_locator.dart';
import 'package:sizer/sizer.dart';
import 'package:migacy_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'business_logic/blocs/authentication_bloc/auth_bloc/auth_bloc.dart';
import 'business_logic/blocs/connection_bloc/connection_bloc.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ConnectedBloc()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: L10n.all,
            routes: Routes.routes,
            theme: AppThemes.primaryMaterialTheme,
          );
        },
      )));
}
