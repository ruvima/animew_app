import 'package:animew_app/core/constants.dart';
import 'package:animew_app/core/failure.dart';
import 'package:animew_app/core/widgets/custom_inkwell_button.dart';
import 'package:animew_app/core/widgets/failure_screen.dart';
import 'package:animew_app/core/widgets/network_fading_image.dart';
import 'package:animew_app/features/anime_nav/anime_nav.dart';
import 'package:animew_app/features/anime_nav/anime_nav_controller.dart';
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:animew_app/features/anime_nav/details/details_screen.dart';
import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AnimeW'),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            isScrollable: false,
            padding: EdgeInsets.symmetric(horizontal: 18),
            indicatorColor: Pallete.grey,
            tabs: [
              Tab(
                text: 'Shows',
              ),
              Tab(
                text: 'Genres',
              ),
              Tab(
                text: 'Ongoing',
              ),
            ],
          ),
        ),
        body: const _ExploreTabs(),
        bottomNavigationBar: const AnimeNav(),
      ),
    );
  }
}

class _ExploreTabs extends StatelessWidget {
  const _ExploreTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _AnimeCarrusel(
              headline: 'Current Season',
            ),
          ],
        ),
        const Center(
          child: Text('Not implemented'),
        ),
        const Center(
          child: Text('Not implemented'),
        ),
      ],
    );
  }
}

class _AnimeCarrusel extends ConsumerWidget {
  const _AnimeCarrusel({
    Key? key,
    required this.headline,
  }) : super(key: key);
  final String headline;

  @override
  Widget build(BuildContext context, ref) {
    Future.delayed(Duration.zero, () {
      ref.read(animeNavControllerProvider.notifier).getSeasonNow();
    });
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 3),
      height: 310,
      width: double.infinity,
      child: Card(
        color: Pallete.blue800,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 18,
            bottom: 18,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headline,
                style: theme.textTheme.headline5,
              ),
              const SizedBox(height: SpacingHelper.kListItemSpacing),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final animeState =
                        ref.watch(animeNavControllerProvider).seasonNow;
                    return animeState.when(
                      data: (data) {
                        return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          separatorBuilder: (_, __) => const SizedBox(
                              width: SpacingHelper.kListItemSpacing),
                          itemBuilder: (context, index) {
                            final anime = data[index];
                            return _AnimeCoverInfo(anime: anime);
                          },
                        );
                      },
                      error: (e, s) {
                        if (e is Failure) {
                          return FailureBody(message: e.message);
                        }
                        return const FailureBody(
                            message: 'Something went wrong');
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimeCoverInfo extends StatelessWidget {
  const _AnimeCoverInfo({
    Key? key,
    required this.anime,
  }) : super(key: key);
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return CustomInkwellButton(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(anime: anime),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: 100,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  BordeRadiusHelper.kBorderRaidus,
                ),
              ),
              child: SizedBox(
                height: 110,
                width: 80,
                child: NetworkFadingImage(
                  path: anime.imageUrl,
                  tag: '${anime.title}_${anime.malId}',
                ),
              ),
            ),
          ),
          const SizedBox(height: SpacingHelper.kListItemSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    anime.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${anime.episodes}(${anime.status})',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '${anime.score}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
