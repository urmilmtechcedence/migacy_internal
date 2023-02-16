import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:migacy_app/resources/configs/routes/routes.dart';

import '../../../business_logic/blocs/connection_bloc/connection_bloc.dart';
import '../../../business_logic/blocs/connection_bloc/connection_state/connection_state.dart';
import '../../../resources/assets_path/assets_path.dart';
import '../../../resources/configs/helpers/helpers.dart';
import '../../../resources/configs/service_locator/service_locator.dart';
import '../../../resources/services/database/database.dart';
import '../../../resources/services/database/database_keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isConnected = true;
  bool isStopped = false;

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  checkConnection() async {
    isConnected = await Helpers.checkInternetConnectivity();
    await Timer.periodic(const Duration(seconds: 2), (timer) async {
      isConnected = await Helpers.checkInternetConnectivity();
      if (isConnected == false) {
        timer.cancel();
      } else if (isConnected == true) {
        timer.cancel();
        DatabaseService databaseService = serviceLocator.get<DatabaseService>();
        var authStatus = databaseService.getFromDisk(DatabaseKeys.authStatus) ?? "";
        debugPrint("--- $authStatus");
        var isLoginStatus =
            databaseService.getFromDisk(DatabaseKeys.isLoginSession);
        if (authStatus == "done") {
          //open direct login screen
          Get.offAndToNamed(Routes.loginScreen);
        } else if (authStatus == "" || authStatus == "skip") {
          //open onboarding screen
          Get.offAndToNamed(Routes.onBoardingScreen);
        }
      }
      if (mounted) {
        setState(() {
          isConnected;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: colorScheme.primary, // Note RED here
    ));

    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, connectionState) {
        // TODO: implement listener
        if (connectionState is ConnectedFailureState) {
          Helpers.logPrint(context, "");
        } else if (connectionState is ConnectedSucessState) {
          Helpers.logPrint(context, "");
        }
      },
      builder: (context, connectionState) {
        if (connectionState is ConnectedFailureState) {
          Helpers.logPrint(context, "");
        }
        return Scaffold(
          body: SafeArea(
            child: Image.asset(
              AssetsPath.splashBg,
              fit: BoxFit.fill,
            ),
          ),
          backgroundColor: colorScheme.background,
        );
      },
    );
  }
}
