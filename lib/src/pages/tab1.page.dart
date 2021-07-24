import 'package:flutter/material.dart';
import 'package:noticias_flutter/src/services/news_services.dart';
import 'package:noticias_flutter/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key key}) : super(key: key);

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsServices>(context);

    return Scaffold(
        body: (newService.headlines.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListaNoticias(newService.headlines)));
  }

  @override
  bool get wantKeepAlive => true;
}
