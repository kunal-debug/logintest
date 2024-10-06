import 'package:flutter/material.dart';
import 'package:logintest/Theme/app_colors.dart';
import 'package:logintest/Theme/app_textstyle.dart';
import 'package:logintest/presentation/screens/auth/login_screen.dart';
import 'package:logintest/provider/auth/auth_provider.dart';
import 'package:logintest/utilities/common_methods.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provider/menuItem/menuitem_provider.dart';
import '../../components/appbar/common_appbar.dart';
import '../../components/buttons/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().boxColor,
        appBar: CustomAppBar(
          title: 'Home',
          showBackButton: false,
        ),
        body: Consumer2<AuthProvider, MenuitemProvider>(
          builder: (context, v, v1, child) {
            if (v.dataList.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1, // Adjust the item size
                      ),
                      itemCount: v.dataList.length,
                      itemBuilder: (context, index) {
                        final loginResponse = v.dataList[index];
                        return GestureDetector(
                          onTap: () {
                            v1.passId(loginResponse.id.toString(), context);
                          },
                          child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(8),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ID: ${loginResponse.id}',
                                      style: AppTextStyle.titleExtraLarge
                                          .copyWith(
                                              fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      'Department: ${loginResponse.deptName}',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
