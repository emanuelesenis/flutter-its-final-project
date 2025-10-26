import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/test_api_cubit.dart';

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  @override
  void initState() {
    super.initState();
    context.read<TestApiCubit>().getMangadexInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TestApiCubit, List<MangaModel>>(
          builder: (context, mangas) {
            if (kDebugMode) {
              print(mangas.toString());
            }
            if (mangas.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: List.generate(
                  mangas.length,
                  (index) => Column(
                    children: [
                      Text(mangas[index].title!),
                      Text(mangas[index].rating),
                      Text('${mangas[index].minimumAge}+'),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
              // return SingleChildScrollView(
              //   child: Column(
              //     children: List.generate(
              //       mangas[2].chapters[0].pages.length,
              //       (index) => Image.network(mangas[2].chapters[0].pages[index]),
              //     ),
              //   ),
              // );
            }
          },
        ),
      ),
    );
  }
}
