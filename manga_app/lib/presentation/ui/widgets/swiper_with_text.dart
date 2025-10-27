import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/bloc/category_carousel_bloc.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/providers/providers.dart';

class SwiperWithText extends StatefulWidget {
  final double? height;
  final double? width;

  const SwiperWithText({super.key, this.height, this.width});

  @override
  State<SwiperWithText> createState() => _SwiperWithTextState();
}

class _SwiperWithTextState extends State<SwiperWithText> {
  late final List<MangaModel> _mangas;

  @override
  void initState() {
    super.initState();
    _mangas = getIt<MangaDexApi>().mangas;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? context.screenHeight * 0.30,
      width: widget.width ?? double.infinity,
      child: Swiper(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          final MangaModel manga = _mangas[index];
          return GestureDetector(
            onTap: () {

              context.push('/details/${manga.id}');
            },
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  // Immagine di sfondo
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.network(
                      manga.cover,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  // Filtro colorato sopra l'immagine
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: context.colors.imageOverlay,
                  ),
                  // Testo sovrapposto all'immagine
                  Positioned(
                    bottom: 32,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          manga.title ??
                              'TITOLO NON DISPONIBILE',
                          style: context.textStyles.h2.copyWith(
                            color: context.colors.textSecondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          manga.status,
                          style: context.textStyles.h4.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.only(left: 16, bottom: 16),
        ),
        autoplay: true,
        loop: true,
      ),
    );
  }
}
