import 'package:flutter/material.dart';
import 'package:noticias_flutter/src/pages/tabs.page.dart';
import 'package:noticias_flutter/src/services/news_services.dart';
import 'package:noticias_flutter/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new NewsServices(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: TabsPage(),
        theme: miTema,
      ),
    );
  }
}
