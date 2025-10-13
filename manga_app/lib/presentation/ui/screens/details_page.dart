import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatefulWidget {
  final String? mangaId;

  const DetailsPage({super.key, this.mangaId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Scaffold(
      backgroundColor: colors.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 24, top: 8),
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Section with Cover Image
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/episode1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Stack(
                  children: [
                    BeOffset(
                      offset: const Offset(0, 80),
                      child: Row(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Manga Cover
                          Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/episode1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Title and Metadata
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ATTACK ON TITAN',
                                style: textStyle.h1.copyWith(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Author',
                                style: textStyle.body.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Status',
                                style: textStyle.body.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Tab Bar
                  ],
                ),
              ),
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Details Tab
                _buildDetailsTab(context),
                // Chapters Tab
                _buildChaptersTab(context),
                // Similar Tab
                _buildSimilarTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsTab(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chapter Button and Rating
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(right: 64),
                  decoration: BoxDecoration(
                    color: colors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Avvio lettura capitolo'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: colors.backgroundColor,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Cap 1',
                              style: textStyle.h4.copyWith(
                                color: colors.backgroundColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Age Rating and Stars
              RatingSection(rating: 12, stars: 4),
            ],
          ),
          const SizedBox(height: 32),
          // Tags Section
          TagsSection(),

          const SizedBox(height: 32),
          Text(
            'In un mondo in cui l’umanità vive circondata da gigantesche mura per difendersi da creature colossali chiamate Titani, la pace sembra solo un fragile equilibrio. La storia segue un gruppo di giovani determinati a scoprire la verità dietro l’esistenza dei Titani e a lottare per la libertà. Tra battaglie spettacolari, misteri e colpi di scena, il manga intreccia azione e dramma in un racconto epico sulla sopravvivenza e sul desiderio di libertà.',
            style: textStyle.body.copyWith(
              color: colors.textPrimary,
              height: 1.6,
              fontSize: 16,
            ),
          ),
          if (widget.mangaId != null) ...[
            const SizedBox(height: 24),
            Text(
              'ID: ${widget.mangaId}',
              style: textStyle.body.copyWith(
                color: colors.textPrimary.withValues(alpha: 0.5),
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildChaptersTab(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return ListView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: textStyle.body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(
              'Capitolo ${index + 1}',
              style: textStyle.h4.copyWith(color: colors.textPrimary),
            ),
            subtitle: Text(
              'Pubblicato il ${DateTime.now().subtract(Duration(days: index * 7)).day}/${DateTime.now().month}/${DateTime.now().year}',
              style: textStyle.body.copyWith(
                color: colors.textPrimary.withValues(alpha: 0.6),
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Apertura Capitolo ${index + 1}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSimilarTab(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return GridView.builder(
      padding: const EdgeInsets.all(24.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final titles = [
          'One Piece',
          'Naruto',
          'Dragon Ball',
          'Demon Slayer',
          'My Hero Academia',
          'Jujutsu Kaisen',
        ];

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.book,
                      size: 40,
                      color: colors.primaryColor.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titles[index],
                        style: textStyle.h4.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: colors.primaryColor,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '4.${index + 1}',
                            style: textStyle.body.copyWith(
                              color: colors.textPrimary.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Tag extends StatelessWidget {
  final String label;

  const Tag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colors.primaryColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.primaryColor.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: textStyle.body.copyWith(
          color: colors.primaryColor,
          fontSize: 14,
        ),
      ),
    );
  }
}

class TagWithIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  const TagWithIcon({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.primaryColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: colors.primaryColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: textStyle.body.copyWith(
              color: colors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class TagsSection extends StatelessWidget {
  const TagsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TAG',
          style: textStyle.h3.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.normal,
            fontFamily: 'Aboreto',
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            TagWithIcon(label: 'Sport', icon: Icons.sports_baseball),
            Tag(label: 'Azione'),
            Tag(label: 'Drama'),
          ],
        ),
      ],
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection({super.key, required this.rating, required this.stars});

  final int rating;
  final int stars;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 20, 8),
          margin: const EdgeInsets.fromLTRB(12, 0, 0, 4),
          transform: Matrix4.skewX(-.3),
          decoration: BoxDecoration(
            color: colors.primaryColor.withValues(alpha: 0.4),
          ),
          child: Container(
            transform: Matrix4.skewX(.3),
            child: Text(
              '+$rating',

              style: textStyle.body.copyWith(
                color: colors.backgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Row(
          children: List.generate(stars, (index) {
            return Icon(
              index < stars ? Icons.star : Icons.star_border,
              color: colors.primaryColor,
              size: 16,
            );
          }),
        ),
      ],
    );
  }
}
