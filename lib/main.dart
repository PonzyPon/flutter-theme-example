import 'package:flutter/material.dart';
import 'package:flutter_theme_example/theme/dynamic_theme.dart';
import 'package:flutter_theme_example/theme_select.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Flutter Theme Example',
          theme: theme,
          home: ThemeSelectPage(),
        );
      },
    );
  }
}
