import 'package:flutter/material.dart';
import 'package:logintest/Theme/app_colors.dart';
import 'package:logintest/Theme/app_textstyle.dart';
import 'package:logintest/utilities/common_methods.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provider/auth/auth_provider.dart';
import '../../../utilities/validators.dart';
import '../../components/buttons/button.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  bool _obscurePassword = true;



  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  "Login",
                  style: AppTextStyle.titleExtraLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Email Field
              _label("Email ID"),
              TextFormField(
                controller: _emailController,
                style: AppTextStyle.titleMedium,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  hintStyle: AppTextStyle.titleSmall.copyWith(
                    color: AppColors().extraGreyLight,
                  ),
                  contentPadding: EdgeInsets.all(12),
                ),
                validator: Validator.emailValidator,
              ),
              const SizedBox(
                height: 20,
              ),
              // Password Field
              _label("Password"),
              TextFormField(
                  controller: _passwordController,
                  style: AppTextStyle.titleMedium,
                  obscureText: _obscurePassword,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: AppTextStyle.titleSmall.copyWith(
                      color: AppColors().extraGreyLight,
                    ),
                    contentPadding: const EdgeInsets.all(12),
                    suffixIconConstraints:
                        const BoxConstraints(maxHeight: 20, minWidth: 40),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                  ),
                  validator: Validator.passwordValidator),
              const SizedBox(
                height: 32.0,
              ),
              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton.filledButton(
                    title: "Login",
                    onTap: () {
                      if (!_loginFormKey.currentState!.validate()) {
                        return;
                      }

                      Provider.of<AuthProvider>(context, listen: false).login(
                        _emailController.text.toString(),
                        _passwordController.text.toString(),
                        context
                      );
                     
                    },
                    isLoading:
                        Provider.of<AuthProvider>(context).isLoginLoading),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(text, style: AppTextStyle.titleMedium),
          ],
        ),
      );
}
