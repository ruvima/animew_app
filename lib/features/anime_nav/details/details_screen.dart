import 'package:animew_app/core/constants.dart';
import 'package:animew_app/core/utils/shorten_number.dart';
import 'package:animew_app/core/widgets/custom_divider.dart';
import 'package:animew_app/core/widgets/custom_inkwell_button.dart';
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
  static const _animationDuration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      _controller.forward();
    }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _HeaderImages(
            coverImageOpacity: coverImageOpacity,
            anime: anime,
            titleOpacity: titleOpacity,
          ),
          const SizedBox(height: SpacingHelper.kListItemSpacing),
          _HeaderButtons(
            detailsIconsOpacity: detailsIconsOpacity,
            anime: anime,
          ),
          const SizedBox(height: SpacingHelper.kMediumSpacing),
          _Overview(
            anime: anime,
            synopsysOpacity: synopsysOpacity,
            informationOpacity: informationOpacity,
          ),
        ],
      ),
    );
  }
}

class _HeaderButtons extends StatelessWidget {
  const _HeaderButtons({
    Key? key,
    required this.detailsIconsOpacity,
    required this.anime,
  }) : super(key: key);

  final Animation<double> detailsIconsOpacity;
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.27,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: FadeTransition(
              opacity: detailsIconsOpacity,
              child: Consumer(
                builder: (context, ref, child) {
                  final animeState = ref.watch(animeNavControllerProvider);
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        ),
      ],
    );
  }
}

class _HeaderImages extends StatelessWidget {
  const _HeaderImages({
    Key? key,
    required this.coverImageOpacity,
    required this.anime,
    required this.titleOpacity,
  }) : super(key: key);

  final Animation<double> coverImageOpacity;
  final Anime anime;
  final Animation<double> titleOpacity;

  @override
  Widget build(BuildContext context) {
    final double animeHeight = MediaQuery.of(context).size.height * 0.2;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        FadeTransition(
          opacity: coverImageOpacity,
          child: _BannerImage(
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
          child: _CoverImage(
            animeHeight: animeHeight,
            anime: anime,
            titleOpacity: titleOpacity,
          ),
        ),
      ],
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
    final information = [
      Information(title: 'Name: ', content: anime.title),
      Information(title: 'Score: ', content: '${anime.score}'),
      Information(title: 'Rank: ', content: '${anime.rank}'),
      Information(title: 'Popularity: ', content: '${anime.popularity}'),
      Information(title: 'Type: ', content: anime.type),
      Information(title: 'Season: ', content: anime.season),
      Information(title: 'Episodes: ', content: '${anime.episodes}'),
      Information(title: 'Status: ', content: anime.status),
      Information(title: 'Year: ', content: '${anime.year}'),
      Information(title: 'Aired: ', content: anime.aired),
      Information(title: 'Duration: ', content: anime.duration),
      Information(title: 'Source: ', content: anime.source),
      Information(title: 'Rating: ', content: anime.rating),
      Information(title: 'Genres: ', content: anime.genresCommaSeparated),
      Information(title: 'Studios: ', content: anime.studiosCommaSeparated),
      Information(title: 'Licensors: ', content: anime.licensorsCommaSeparated),
      Information(title: 'Producers: ', content: anime.producersCommaSeparated),
    ];

    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: const BoxDecoration(
          color: Pallete.blue900,
          borderRadius: BorderRadius.all(
            Radius.circular(BordeRadiusHelper.kBorderRaidus),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeTransition(
                opacity: synopsysOpacity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: SpacingHelper.kListItemSpacing),
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
                  ],
                ),
              ),
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
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: information.length,
                      itemBuilder: (BuildContext context, int index) {
                        final info = information[index];
                        return _InformationWidget(
                          title: info.title,
                          content: info.content,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Information {
  final String title;
  final String content;

  const Information({
    required this.title,
    required this.content,
  });
}

class _InformationWidget extends StatelessWidget {
  const _InformationWidget({
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

class _CoverImage extends StatelessWidget {
  const _CoverImage({
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
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(BordeRadiusHelper.kBorderRaidus),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.27,
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
    return CustomInkwellButton(
      backgroundColor: Pallete.darkBlue,
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 35,
            color: Pallete.blue400,
          ),
          Text(
            text,
            style: theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}

class _BannerImage extends StatelessWidget {
  const _BannerImage({
    Key? key,
    required this.anime,
  }) : super(key: key);
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
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
