import 'package:flutter/material.dart';
import 'package:noticias_flutter/src/models/category_model.dart';
import 'package:noticias_flutter/src/services/news_services.dart';
import 'package:noticias_flutter/src/theme/tema.dart';
import 'package:noticias_flutter/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsServices>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),
            Expanded(
              child: ListaNoticias(
                newsServices.getArticulosCategoriaSeleccionada,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsServices>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final name = categories[index].name;
          return Container(
            width: 110,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _CategoryButton(categories[index]),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${name[0].toUpperCase()}${name.substring(1)}')
                  ],
                )),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsServices>(context, listen: false);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsServices>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: (newsService.selectedCategory == this.category.name)
              ? miTema.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
