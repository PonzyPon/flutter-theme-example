import 'package:flutter/material.dart';
import 'package:flutter_theme_example/theme/dynamic_theme.dart';
import 'package:flutter_theme_example/theme/theme_type.dart';

class ThemeSelectPage extends StatefulWidget {
  ThemeSelectPage();

  @override
  _ThemeSelectState createState() => new _ThemeSelectState();
}

class _ThemeSelectState extends State<ThemeSelectPage> {
  String _groupValue = '';

  @override
  void initState() {
    DynamicTheme.of(context).loadThemeType().then((ThemeType type) {
      setState(() {
        _groupValue = type.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Select'),
      ),
      body: ListView.builder(
        itemCount: ThemeType.values().length,
        itemBuilder: (context, index) {
          ThemeType themeType = ThemeType.values()[index];
          String value = themeType.toString();
          return RadioListTile(
              title: Text(themeType.toString()),
              onChanged: (value) {
                DynamicTheme.of(context).setTheme(ThemeType.of(value));
                setState(() {
                  _groupValue = value;
                });
              },
              value: value,
              groupValue: _groupValue);
        },
      ),
    );
  }
}
