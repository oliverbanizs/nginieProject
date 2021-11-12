import 'package:flutter/material.dart';
import 'package:nginie/utils/constants.dart';
import 'package:nginie/view/widgets/primaryButton.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Spacer(flex: 1),
              Image.network(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "https://is1-ssl.mzstatic.com/image/thumb/Purple114/v4/a3/f9/7e/a3f97eea-b8ff-c634-850f-9191260dc24f/AppIcon-2-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png"
                    : "https://is1-ssl.mzstatic.com/image/thumb/Purple114/v4/a3/f9/7e/a3f97eea-b8ff-c634-850f-9191260dc24f/AppIcon-2-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png",
                height: 600,
              ),
              Spacer(),
              PrimaryButton(
                text: "Sign In",
                press: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    '/mainScreen', (Route<dynamic> route) => false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
