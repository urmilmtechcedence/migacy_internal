import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:migacy_app/persentation/widget/auth_button.dart';
import 'package:migacy_app/persentation/widget/intro_view.dart';
import 'package:migacy_app/resources/app_strings/app_strings.dart';
import 'package:migacy_app/resources/app_themes/app_themes.dart';
import 'package:migacy_app/resources/assets_path/assets_path.dart';
import 'package:migacy_app/resources/configs/routes/routes.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/blocs/connection_bloc/connection_bloc.dart';
import '../../../business_logic/blocs/connection_bloc/connection_state/connection_state.dart';
import '../../../resources/configs/service_locator/service_locator.dart';
import '../../../resources/services/database/database.dart';
import '../../../resources/services/database/database_keys.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => OnBoardingStateView();
}

class OnBoardingStateView extends State<OnBoardingView> {
  final PageController controller = PageController();

  // the index of the current page
  int _activePage = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DatabaseService databaseService = serviceLocator.get<DatabaseService>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var colorScheme = Theme.of(context).colorScheme;
    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, connectionState) {
        // TODO: implement listener
        if (connectionState is ConnectedFailureState) {
        } else if (connectionState is ConnectedSucessState) {

        }
      },
      builder: (context, connectionState) {
        if (connectionState is ConnectedFailureState) {
        }
        return Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    if (mounted) {
                      setState(() {
                        _activePage = index;
                      });
                    }
                  },
                  children: [
                    IntroView(
                      position: 0,
                      message: AppStrings.strIntroMessageOne,
                      assetsPath: AssetsPath.introImageOne,
                      onSkipListener: () {
                        //save skip status
                        if(databaseService != null){
                          databaseService.saveToDisk(DatabaseKeys.authStatus, "skip");
                        }
                        redirectLogin();
                      },
                    ),
                    IntroView(
                      position: 1,
                      message: AppStrings.strIntroMessageTwo,
                      assetsPath: AssetsPath.introImageTwo,
                      onSkipListener: () {},
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 150,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(
                              2,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: InkWell(
                                      onTap: () {
                                        controller.animateToPage(index,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn);
                                      },
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor: _activePage == index
                                            ? AppThemes.dotColor
                                            : AppThemes.dotColor,
                                        child: CircleAvatar(
                                          radius: 6.5,
                                          backgroundColor: _activePage == index
                                              ? AppThemes.dotColor
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      if (_activePage == 1) ...[
                        AuthButton(
                          text: AppStrings.strDone,
                          press: () async{
                            if(databaseService != null){
                              databaseService.saveToDisk(DatabaseKeys.authStatus, "done");
                            }
                            //open Login View
                            redirectLogin();
                          },
                          colors: true,
                          color: 0xFF202A39,
                          iconColor: Colors.white,
                          icon: AssetsPath.icNext,
                        )
                      ]
                    ],
                  ),
                )
              ],
            ),
          ),
          backgroundColor: colorScheme.background,
        );
      },
    );
  }

  void redirectLogin() {

    Get.offNamed(Routes.authOptionScreen);
  }
}
