import 'package:animew_app/core/constants.dart';
import 'package:animew_app/core/failure.dart';
import 'package:animew_app/core/widgets/custom_inkwell_button.dart';
import 'package:animew_app/core/widgets/failure_screen.dart';
import 'package:animew_app/core/widgets/network_fading_image.dart';
import 'package:animew_app/core/widgets/primary_button.dart';
import 'package:animew_app/features/anime_nav/anime_nav_controller.dart';
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:animew_app/features/anime_nav/details/details_screen.dart';
import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TopRatingAnime(),
        SizedBox(height: SpacingHelper.kMediumSpacing),
        _NewReleasedAnime(),
        SizedBox(height: SpacingHelper.kListItemSpacing),
      ],
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
    final animeState = ref.watch(animeNavControllerProvider).topAnime;
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
          child: animeState.when(
            data: (data) {
              return ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final anime = data[index];

                  return ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(BordeRadiusHelper.kBorderRaidus),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _PosterImage(anime),
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
                                      anime.title,
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
                                        Text('${anime.score}'),
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
                                        builder: (context) =>
                                            DetailsScreenAnimator(
                                          anime: anime,
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
                itemCount: data.length,
              );
            },
            error: (e, s) => const Center(
              child: Text('Somenthing went wrong'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}

class _PosterImage extends StatelessWidget {
  const _PosterImage(
    this.anime, {
    Key? key,
  }) : super(key: key);
  final Anime anime;

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
      child: NetworkFadingImage(
        path: anime.imageUrl,
        tag: '${anime.title}_${anime.malId}',
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

    return Expanded(
      child: Container(
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: SpacingHelper.kListItemSpacing),
            Text(
              'Upcoming',
              style: theme.textTheme.headline6,
            ),
            const SizedBox(height: SpacingHelper.kListItemSpacing),
            Consumer(
              builder: (context, ref, child) {
                final animeState =
                    ref.watch(animeNavControllerProvider).seasonUpcoming;

                return animeState.when(
                  data: (data) {
                    return Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final anime = data[index];

                          return CustomInkwellButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreenAnimator(anime: anime),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      BordeRadiusHelper.kBorderRaidus,
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: NetworkFadingImage(
                                      path: anime.imageUrl,
                                      tag: '${anime.title}_${anime.malId}',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: SpacingHelper.kListItemSpacing),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        anime.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                      ),
                                      const SizedBox(
                                          height:
                                              SpacingHelper.kListItemSpacing),
                                      Text(anime.aired),
                                      const SizedBox(
                                          height:
                                              SpacingHelper.kListItemSpacing /
                                                  2),
                                      Text(anime.genresCommaSeparated),
                                      const SizedBox(
                                          height:
                                              SpacingHelper.kListItemSpacing /
                                                  2),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(
                          thickness: 1,
                          color: Pallete.grey,
                        ),
                        itemCount: data.length,
                      ),
                    );
                  },
                  error: (e, s) {
                    if (e is Failure) {
                      return FailureBody(message: e.message);
                    }
                    return const FailureBody(message: 'Something went wrong');
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
