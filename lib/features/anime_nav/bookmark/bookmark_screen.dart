import 'package:animew_app/core/constants.dart';
import 'package:animew_app/core/widgets/custom_inkwell_button.dart';
import 'package:animew_app/core/widgets/network_fading_image.dart';
import 'package:animew_app/features/anime_nav/anime_nav_controller.dart';
import 'package:animew_app/features/anime_nav/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeState = ref.watch(animeNavControllerProvider);
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bookmarks',
            style: theme.headline5,
          ),
          const SizedBox(height: SpacingHelper.kMediumSpacing),
          Expanded(
            child: ListView.builder(
              itemCount: animeState.bookmarks.length,
              itemBuilder: (context, index) {
                final anime = animeState.bookmarks[index];
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
                  child: Card(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        ClipRRect(
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
                        const SizedBox(width: SpacingHelper.kListItemSpacing),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                anime.title,
                                style: theme.headline6,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                              const SizedBox(
                                  height: SpacingHelper.kListItemSpacing),
                              Text(
                                anime.type,
                                style: theme.bodyText1,
                              ),
                              const SizedBox(
                                  height: SpacingHelper.kListItemSpacing / 2),
                              Text(
                                anime.aired,
                                style: theme.bodyText1,
                              ),
                              const SizedBox(
                                  height: SpacingHelper.kListItemSpacing / 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
