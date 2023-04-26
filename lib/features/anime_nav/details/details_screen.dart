import 'package:animew_app/core/constants.dart';
import 'package:animew_app/core/widgets/custom_divider.dart';
import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  final double animeHeight = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const _CoverImage(),
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
                  ),
                ),
              ],
            ),
            SizedBox(height: animeHeight / 2),
            const _OverviewTabs(),
          ],
        ),
      ),
    );
  }
}

class _OverviewTabs extends StatefulWidget {
  const _OverviewTabs({
    Key? key,
  }) : super(key: key);

  @override
  State<_OverviewTabs> createState() => _OverviewTabsState();
}

class _OverviewTabsState extends State<_OverviewTabs>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          indicator: const BoxDecoration(
              color: Pallete.blue800,
              border: Border(
                bottom: BorderSide(
                  width: 3.0,
                  color: Pallete.grey,
                ),
              )),
          controller: tabController,
          tabs: const [
            Tab(
              text: 'Info',
            ),
            Tab(
              text: 'Watch',
            ),
          ],
        ),
        SizedBox(
          height: 600,
          child: TabBarView(
            controller: tabController,
            children: [
              const _OverviewTabWidget(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                color: Pallete.blue900,
                child: const Center(
                  child: Text('not implemented'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OverviewTabWidget extends StatelessWidget {
  const _OverviewTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      color: Pallete.blue900,
      child: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Synopsis',
                style: theme.textTheme.headline6,
              ),
              const CustomDivider(),
              Text(
                'The young priestess goes with her team to adventure, but the road of adventure immediately leads them to trouble. Everything seems to be lost, but adventurers are saved by the Goblin Killer.',
                style: theme.textTheme.bodyText2,
              ),
              const SizedBox(height: SpacingHelper.kListItemSpacing),
              Text(
                'Information',
                style: theme.textTheme.headline6,
              ),
              const CustomDivider(),
              Column(
                children: const [
                  _InformatioWidget(
                    title: 'Name: ',
                    content: 'Goblin Slayer',
                  ),
                  _InformatioWidget(
                    title: 'Scre: ',
                    content: '8.2',
                  ),
                  _InformatioWidget(
                    title: 'Type: ',
                    content: 'TV',
                  ),
                  _InformatioWidget(
                    title: 'Episodes: ',
                    content: '24',
                  ),
                  _InformatioWidget(
                    title: 'Status: ',
                    content: 'Finished Airing',
                  ),
                  _InformatioWidget(
                    title: 'Aired: ',
                    content: 'Jul5, 2019 to Dec 13,2019',
                  ),
                  _InformatioWidget(
                    title: 'Licensors: ',
                    content: 'TSM Entrertainment',
                  ),
                  _InformatioWidget(
                    title: 'Source: ',
                    content: 'Manga',
                  ),
                ],
              ),
              const SizedBox(height: SpacingHelper.kListItemSpacing),
              Text(
                'Characters & Voice Actors',
                style: theme.textTheme.headline6,
              ),
              const CustomDivider(),
              Column(
                children: const [
                  _InformatioWidget(
                    title: 'Name: ',
                    content: 'Goblin Slayer',
                  ),
                  _InformatioWidget(
                    title: 'Scre: ',
                    content: '8.2',
                  ),
                  _InformatioWidget(
                    title: 'Type: ',
                    content: 'TV',
                  ),
                  _InformatioWidget(
                    title: 'Episodes: ',
                    content: '24',
                  ),
                  _InformatioWidget(
                    title: 'Status: ',
                    content: 'Finished Airing',
                  ),
                  _InformatioWidget(
                    title: 'Aired: ',
                    content: 'Jul5, 2019 to Dec 13,2019',
                  ),
                  _InformatioWidget(
                    title: 'Licensors: ',
                    content: 'TSM Entrertainment',
                  ),
                  _InformatioWidget(
                    title: 'Source: ',
                    content: 'Manga',
                  ),
                ],
              ),
              Column(
                children: const [
                  _InformatioWidget(
                    title: 'Name: ',
                    content: 'Goblin Slayer',
                  ),
                  _InformatioWidget(
                    title: 'Scre: ',
                    content: '8.2',
                  ),
                  _InformatioWidget(
                    title: 'Type: ',
                    content: 'TV',
                  ),
                  _InformatioWidget(
                    title: 'Episodes: ',
                    content: '24',
                  ),
                  _InformatioWidget(
                    title: 'Status: ',
                    content: 'Finished Airing',
                  ),
                  _InformatioWidget(
                    title: 'Aired: ',
                    content: 'Jul5, 2019 to Dec 13,2019',
                  ),
                  _InformatioWidget(
                    title: 'Licensors: ',
                    content: 'TSM Entrertainment',
                  ),
                  _InformatioWidget(
                    title: 'Source: ',
                    content: 'Manga',
                  ),
                ],
              ),
            ],
          ),
        ],
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
      children: [
        Text(
          title,
          style: theme.textTheme.bodyText2,
        ),
        Text(
          content,
          style: theme.textTheme.bodyText2,
        ),
      ],
    );
  }
}

class _AnimeImageDetails extends StatelessWidget {
  const _AnimeImageDetails({
    Key? key,
    required this.animeHeight,
  }) : super(key: key);
  final double animeHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(BordeRadiusHelper.kBorderRaidus),
            child: SizedBox(
              width: 100,
              height: animeHeight,
              child: Image.network(
                'https://th.bing.com/th/id/OIP.cc_ZpP2ZwpPcixCS_ZZPagAAAA?pid=ImgDet&rs=1',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),
          ),
          const SizedBox(width: SpacingHelper.kMediumSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Goblin Slayer',
                  style: theme.textTheme.headline5,
                ),
                const SizedBox(height: SpacingHelper.kMediumSpacing * 2.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _AnimeImageDetailsIcon(
                      icon: Icons.remove_red_eye,
                      text: '20.5K',
                    ),
                    _AnimeImageDetailsIcon(
                      icon: Icons.thumb_up,
                      text: '3.8K',
                    ),
                    _AnimeImageDetailsIcon(
                      icon: Icons.share,
                      text: 'Share',
                    ),
                    _AnimeImageDetailsIcon(
                      icon: Icons.bookmarks,
                      text: 'Bookmark',
                    ),
                  ],
                ),
              ],
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
  }) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
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
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({
    Key? key,
  }) : super(key: key);

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
          'https://th.bing.com/th/id/OIP.tIwo2Tn2yV_elKCkgracJAHaKh?pid=ImgDet&rs=1',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const SizedBox(),
        ),
      ),
    );
  }
}
