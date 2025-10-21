import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/category_carousel.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Esplora")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 64),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Cerca un titolo',
                  suffixIcon: Icon(Icons.search),
                ),
                onSubmitted: (String value) => {
                  if(value.isNotEmpty){
                    context.go("")
                  }
                },
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  spacing: 8,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),
                      onPressed: () => {},
                      child: Text("Categoria 1"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),
                      onPressed: () => {},
                      child: Text("Categoria 2"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),
                      onPressed: () => {},
                      child: Text("Categoria 3"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),
                      onPressed: () => {},
                      child: Text("Categoria 4"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),

                      onPressed: () => {},
                      child: Text("Categoria 5"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 64),
              CategoryCarousel(categoryName: "Popolari"),
            ],
          ),
        ),
      ),
    );
  }
}
