import 'package:animew_app/core/constants.dart';
import 'package:animew_app/core/widgets/primary_button.dart';
import 'package:animew_app/features/anime_nav/anime_nav_controller.dart';
import 'package:animew_app/features/anime_nav/details/details_screen.dart';
import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          _TopRatingAnime(),
          SizedBox(height: SpacingHelper.kMediumSpacing),
          _NewReleasedAnime(),
          SizedBox(height: SpacingHelper.kListItemSpacing),
        ],
      ),
    );
  }
}

class _TopRatingAnime extends ConsumerWidget {
  const _TopRatingAnime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final animeState = ref.watch(animeNavControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            'Top Rating',
            style: theme.textTheme.headline6,
          ),
        ),
        const SizedBox(height: SpacingHelper.kListItemSpacing),
        SizedBox(
          height: 250,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(BordeRadiusHelper.kBorderRaidus),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _PosterImage(animeState.anime.imageUrl),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: SpacingHelper.kListItemSpacing),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  animeState.anime.title,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.fade,
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Text('${animeState.anime.score}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          PrimaryButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      anime: animeState.anime,
                                    ),
                                  ));
                            },
                            text: 'Watch now',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              width: SpacingHelper.kListItemSpacing,
            ),
            itemCount: animeState.topAnime.length,
          ),
        ),
      ],
    );
  }
}

class _PosterImage extends StatelessWidget {
  const _PosterImage(
    this.imageUrl, {
    Key? key,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
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
      ),
    );
  }
}

class _NewReleasedAnime extends StatelessWidget {
  const _NewReleasedAnime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        color: Pallete.blue800,
        borderRadius: BorderRadius.all(
          Radius.circular(BordeRadiusHelper.kBorderRaidus),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SpacingHelper.kListItemSpacing),
          Text(
            'Upcoming',
            style: theme.textTheme.headline6,
          ),
          const SizedBox(height: SpacingHelper.kListItemSpacing),
          SizedBox(
            height: 500,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          BordeRadiusHelper.kBorderRaidus,
                        ),
                      ),
                      child: Container(
                        color: Colors.red,
                        height: 80,
                        width: 80,
                        child: Image.network(
                          'https://cdn.myanimelist.net/images/characters/16/7634.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: SpacingHelper.kListItemSpacing),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Goblin Slayer 2nd Season'),
                        SizedBox(height: SpacingHelper.kListItemSpacing),
                        Text('Sunday, May 10th, 2020'),
                        SizedBox(height: SpacingHelper.kListItemSpacing / 2),
                        Text('Romance, Slice of life, Action'),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (_, __) => const Divider(
                thickness: 1,
                color: Pallete.grey,
              ),
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
