import 'package:flutter/material.dart';
import 'package:mybooks/data/repositories/book_repository.dart';
import 'package:mybooks/localizations.dart';
import 'package:mybooks/log.dart';
import 'package:mybooks/services/api_service.dart';
import 'package:mybooks/services/preferences_service.dart';
import 'package:mybooks/ui/kit/mb_colors.dart';
import 'package:mybooks/ui/pages/books_page.dart';
import 'package:mybooks/ui/pages/sign_page.dart';
import 'package:mybooks/ui/pages/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mybooks/utils/texts.dart';

const _tag = 'app';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  final _namedRoutes = {
    WelcomePage.routeName: (_) => const WelcomePage(),
    BooksPage.routeName: (_) => const BooksPage(),
  };
  late final _prefs = PreferencesService.instance;
  late final _api = ApiService(prefs: _prefs);
  late final _bookRepository = BookRepository(api: _api);

  late final _flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  late final _raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _prefs),
        Provider.value(value: _api),
        Provider.value(value: _bookRepository),
      ],
      child: _app(context),
    );
  }

  Widget _app(BuildContext context) {
    final outlineButtonStyle = OutlinedButton.styleFrom(
      primary: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            );
          }
          return BorderSide.none;
        },
      ),
    );

    final theme = ThemeData(
      brightness: Brightness.light,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: MBColors.lightColors.backgroundColor,
      highlightColor: MBColors.lightColors.splashColor,
      splashColor: MBColors.lightColors.splashColor,
      colorScheme: const ColorScheme.light(secondary: MBColors.mainColor),
      primaryColor: MBColors.lightColors.backgroundColor,
      textButtonTheme: TextButtonThemeData(style: _flatButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: _raisedButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
    );

    final dartTheme = ThemeData(
      brightness: Brightness.dark,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: MBColors.darkColors.backgroundColor,
      highlightColor: MBColors.darkColors.highlightColor,
      splashColor: MBColors.darkColors.splashColor,
      colorScheme: const ColorScheme.dark(secondary: MBColors.mainColor),
      primaryColor: MBColors.darkColors.backgroundColor,
      textButtonTheme: TextButtonThemeData(style: _flatButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: _raisedButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
    );

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en')],
      onGenerateTitle: (context) {
        final localizations = AppLocalizations.of(context);
        return localizations?.appTitle ?? 'MyBooks';
      },
      theme: theme,
      darkTheme: dartTheme,
      initialRoute: _initialRoute(),
      routes: _namedRoutes,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  String _initialRoute() {
    if (_prefs.getToken().isNotNullOrEmpty) {
      return BooksPage.routeName;
    } else {
      return WelcomePage.routeName;
    }
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    Log.d(_tag, '_onGenerateRoute $settings');

    Widget page;
    switch (settings.name) {
      case LoginPage.routeName:
        page = LoginPage(
          arguments: settings.arguments as LoginPageArguments,
        );
        break;
      default:
        return null;
    }

    return MaterialPageRoute(
      builder: (_) => page,
    );
  }
}
