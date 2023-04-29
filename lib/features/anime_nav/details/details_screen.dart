import 'package:animew_app/core/constants.dart';
import 'package:animew_app/core/utils/shorten_number.dart';
import 'package:animew_app/core/widgets/custom_divider.dart';
import 'package:animew_app/core/widgets/network_fading_image.dart';
import 'package:animew_app/features/anime_nav/anime_nav_controller.dart';
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreenAnimator extends StatefulWidget {
  const DetailsScreenAnimator({
    Key? key,
    required this.anime,
  }) : super(key: key);
  final Anime anime;

  @override
  State<DetailsScreenAnimator> createState() => _DetailsScreenAnimatorState();
}

class _DetailsScreenAnimatorState extends State<DetailsScreenAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetailsScreen(
      animationController: _controller,
      anime: widget.anime,
    );
  }
}

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    Key? key,
    required this.anime,
    required this.animationController,
  })  : coverImageOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0,
              0.3,
            ),
          ),
        ),
        titleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.3,
              0.4,
            ),
          ),
        ),
        detailsIconsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.4,
              0.6,
            ),
          ),
        ),
        synopsysOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.6,
              0.8,
            ),
          ),
        ),
        informationOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.8,
              1,
            ),
          ),
        ),
        super(key: key);
  final AnimationController animationController;

  final Animation<double> coverImageOpacity;
  final Animation<double> titleOpacity;
  final Animation<double> detailsIconsOpacity;
  final Animation<double> synopsysOpacity;
  final Animation<double> informationOpacity;

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
              FadeTransition(
                opacity: coverImageOpacity,
                child: _CoverImage(
                  anime: anime,
                ),
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
                  animeHeight: animeHeight,
                  anime: anime,
                  titleOpacity: titleOpacity,
                ),
              ),
            ],
          ),
          FadeTransition(
            opacity: detailsIconsOpacity,
            child: Padding(
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
          ),
          _Overview(
            anime: anime,
            synopsysOpacity: synopsysOpacity,
            informationOpacity: informationOpacity,
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({
    Key? key,
    required this.anime,
    required this.synopsysOpacity,
    required this.informationOpacity,
  }) : super(key: key);
  final Anime anime;
  final Animation<double> synopsysOpacity;
  final Animation<double> informationOpacity;
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
            FadeTransition(
              opacity: synopsysOpacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
            ),
            const SizedBox(height: SpacingHelper.kListItemSpacing),
            FadeTransition(
              opacity: informationOpacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information',
                    style: theme.textTheme.headline6,
                  ),
                  const CustomDivider(),
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
                  const SizedBox(height: SpacingHelper.kListItemSpacing),
                ],
              ),
            ),
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
    required this.titleOpacity,
  }) : super(key: key);
  final double animeHeight;
  final Anime anime;
  final Animation<double> titleOpacity;

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
              child: NetworkFadingImage(
                path: anime.imageUrl,
                tag: '${anime.title}_${anime.malId}',
              ),
            ),
          ),
          const SizedBox(width: SpacingHelper.kMediumSpacing / 2),
          Expanded(
            child: FadeTransition(
              opacity: titleOpacity,
              child: Text(
                anime.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headline5,
              ),
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
    required this.anime,
  }) : super(key: key);
  final Anime anime;

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
        child: NetworkFadingImage(
          path: anime.imageUrl,
        ),
      ),
    );
  }
}
