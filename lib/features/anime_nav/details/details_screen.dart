import 'package:animew_app/core/constants.dart';
import 'package:animew_app/core/utils/shorten_number.dart';
import 'package:animew_app/core/widgets/custom_divider.dart';
import 'package:animew_app/features/anime_nav/anime_nav_controller.dart';
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.anime}) : super(key: key);
  final Anime anime;
  final double animeHeight = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              _CoverImage(
                imageUrl: anime.imageUrl,
              ),
              Positioned(
                top: 50,
                child: BackButton(
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: -(animeHeight / 2.5),
                child: _AnimeImageDetails(
                  anime: anime,
                  animeHeight: animeHeight,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130, right: 15),
            child: Consumer(
              builder: (context, ref, child) {
                final animeState = ref.watch(animeNavControllerProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _AnimeImageDetailsIcon(
                      icon: Icons.remove_red_eye,
                      text: shortenNumber(anime.scoredBy),
                      onTap: () {},
                    ),
                    _AnimeImageDetailsIcon(
                      icon: Icons.thumb_up,
                      text: shortenNumber(anime.favorites),
                      onTap: () {},
                    ),
                    _AnimeImageDetailsIcon(
                      icon: Icons.share,
                      text: 'Share',
                      onTap: () {},
                    ),
                    _AnimeImageDetailsIcon(
                      icon: animeState.bookmarks.contains(anime)
                          ? Icons.bookmarks
                          : Icons.bookmarks_outlined,
                      text: 'Bookmark',
                      onTap: () {
                        ref
                            .read(animeNavControllerProvider.notifier)
                            .toggleBookMark(anime);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          _Overview(anime: anime)
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({
    Key? key,
    required this.anime,
  }) : super(key: key);
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: const BoxDecoration(
          color: Pallete.blue900,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        child: ListView(
          children: [
            Text(
              'Synopsis',
              style: theme.textTheme.headline6,
            ),
            const CustomDivider(),
            Text(
              anime.synopsis,
              style: theme.textTheme.bodyText2,
            ),
            const SizedBox(height: SpacingHelper.kListItemSpacing),
            Text(
              'Information',
              style: theme.textTheme.headline6,
            ),
            const CustomDivider(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InformatioWidget(
                  title: 'Name: ',
                  content: anime.title,
                ),
                _InformatioWidget(
                  title: 'Score: ',
                  content: '${anime.score}',
                ),
                _InformatioWidget(
                  title: 'Rank: ',
                  content: '${anime.rank}',
                ),
                _InformatioWidget(
                  title: 'Popularity: ',
                  content: '${anime.popularity}',
                ),
                _InformatioWidget(
                  title: 'Type: ',
                  content: anime.type,
                ),
                _InformatioWidget(
                  title: 'Season: ',
                  content: anime.season,
                ),
                _InformatioWidget(
                  title: 'Episodes: ',
                  content: '${anime.episodes}',
                ),
                _InformatioWidget(
                  title: 'Status: ',
                  content: anime.status,
                ),
                _InformatioWidget(
                  title: 'Year: ',
                  content: '${anime.year}',
                ),
                _InformatioWidget(
                  title: 'Aired: ',
                  content: anime.aired,
                ),
                _InformatioWidget(
                  title: 'Duration: ',
                  content: anime.duration,
                ),
                _InformatioWidget(
                  title: 'Source: ',
                  content: anime.source,
                ),
                _InformatioWidget(
                  title: 'Rating: ',
                  content: anime.rating,
                ),
                _InformatioWidget(
                  title: 'Genres: ',
                  content: anime.genresCommaSeparated,
                ),
                _InformatioWidget(
                  title: 'Studios: ',
                  content: anime.studiosCommaSeparated,
                ),
                _InformatioWidget(
                  title: 'Licensors: ',
                  content: anime.licensorsCommaSeparated,
                ),
                _InformatioWidget(
                  title: 'Producers: ',
                  content: anime.producersCommaSeparated,
                ),
              ],
            ),
            const SizedBox(height: SpacingHelper.kListItemSpacing),
          ],
        ),
      ),
    );
  }
}

class _InformatioWidget extends StatelessWidget {
  const _InformatioWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyText2,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            content,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: theme.textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}

class _AnimeImageDetails extends StatelessWidget {
  const _AnimeImageDetails({
    Key? key,
    required this.animeHeight,
    required this.anime,
  }) : super(key: key);
  final double animeHeight;
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(BordeRadiusHelper.kBorderRaidus),
            child: SizedBox(
              width: 100,
              height: animeHeight,
              child: Image.network(
                anime.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),
          ),
          const SizedBox(width: SpacingHelper.kMediumSpacing / 2),
          Expanded(
            child: Text(
              anime.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimeImageDetailsIcon extends StatelessWidget {
  const _AnimeImageDetailsIcon({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: 35,
            color: Pallete.blue400,
          ),
        ),
        Text(
          text,
          style: theme.textTheme.bodyText2,
        ),
      ],
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: const BoxConstraints(minHeight: 198, maxHeight: 250),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.center,
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromLTRB(
              0,
              0,
              rect.width,
              rect.height,
            ),
          );
        },
        blendMode: BlendMode.dstIn,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const SizedBox(),
        ),
      ),
    );
  }
}
