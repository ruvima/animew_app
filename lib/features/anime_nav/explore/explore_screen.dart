import 'package:animew_app/core/constants.dart';
import 'package:animew_app/theme/pallete.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 5, vsync: this);

    return Scaffold(
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            indicatorColor: Pallete.grey,
            controller: tabController,
            tabs: const [
              Tab(
                text: 'Shows',
              ),
              Tab(
                text: 'Genres',
              ),
              Tab(
                text: 'Ongoing',
              ),
              Tab(
                text: 'Seasonal Anime',
              ),
              Tab(
                text: 'Seasonal Anime',
              ),
            ],
          ),
          Expanded(
            child: _ExploreTabs(tabController),
          ),
        ],
      ),
    );
  }
}

class _ExploreTabs extends StatelessWidget {
  const _ExploreTabs(
    this.tabController, {
    Key? key,
  }) : super(key: key);

  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _AnimeCarrusel(),
              _AnimeCarrusel(),
              _AnimeCarrusel(),
            ],
          ),
        ),
        const Center(
          child: Text("It's rainy here"),
        ),
        const Center(
          child: Text("It's sunny here"),
        ),
        const Center(
          child: Text("It's sunny here"),
        ),
        const Center(
          child: Text("It's sunny here"),
        ),
      ],
    );
  }
}

class _AnimeCarrusel extends StatelessWidget {
  const _AnimeCarrusel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                'Recommendations',
                style: theme.textTheme.headline5,
              ),
              const SizedBox(height: SpacingHelper.kListItemSpacing),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: SpacingHelper.kListItemSpacing),
                  itemBuilder: (context, index) {
                    return const _AnimeCoverInfo();
                  },
                ),
              )
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 150,
          width: 100,
          child: Placeholder(),
        ),
        const SizedBox(height: SpacingHelper.kListItemSpacing),
        const Text(
          'Kimentsu no Yaiba',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          '24 Eps (END)',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        Row(
          children: const [
            Icon(
              Icons.star,
              size: 16,
              color: Colors.orange,
            ),
            SizedBox(width: 2),
            Text(
              '8.81',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
