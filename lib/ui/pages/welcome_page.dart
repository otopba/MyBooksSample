import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybooks/domain/sign_page_page_bloc.dart';
import 'package:mybooks/log.dart';
import 'package:mybooks/ui/kit/mb_button.dart';
import 'package:mybooks/ui/kit/mb_images.dart';
import 'package:mybooks/ui/kit/mb_text_style.dart';
import 'package:mybooks/ui/mb_page_mixin.dart';
import 'package:mybooks/ui/pages/sign_page.dart';

const _tag = 'welcome_page';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/welcome';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with MBPageStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logo(),
          _title(),
          const SizedBox(height: 50),
          _loginButton(),
          const SizedBox(height: 10),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _logo() {
    return SvgPicture.asset(
      MBImages.logo,
      width: 200,
      height: 200,
    );
  }

  Widget _title() {
    return Text(
      localizations.appTitle,
      textAlign: TextAlign.center,
      style: MBTextStyle.instance.styleH2.copyWith(
        color: colors.primaryTextColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: MBButton.primary(
          text: localizations.login,
          onPressed: _onLoginPressed,
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: MBButton.secondary(
          text: localizations.register,
          onPressed: _onRegisterPressed,
        ),
      ),
    );
  }

  void _onLoginPressed() {
    Log.d(_tag, "On login pressed");

    Navigator.pushNamed(
      context,
      LoginPage.routeName,
      arguments: LoginPageArguments(
        signType: SignType.login,
      ),
    );
  }

  void _onRegisterPressed() {
    Log.d(_tag, "On register pressed");

    Navigator.pushNamed(
      context,
      LoginPage.routeName,
      arguments: LoginPageArguments(
        signType: SignType.register,
      ),
    );
  }
}
