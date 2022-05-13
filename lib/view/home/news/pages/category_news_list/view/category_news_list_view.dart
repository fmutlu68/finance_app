import 'package:finance_app/core/extensions/border_radius_extension.dart';
import 'package:finance_app/core/extensions/navigation_extension.dart';
import 'package:finance_app/core/extensions/padding_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/core/start/navigation/routes/navigation_route.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/core/base/state/base_view_state.dart';
import 'package:finance_app/core/base/widget/base_view.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';
import 'package:finance_app/view/home/news/pages/category_news_list/view_model/category_news_list_view_model.dart';

class CategoryNewsList extends StatefulWidget {
  final List<INews> newsList;
  final String title;
  const CategoryNewsList({
    Key? key,
    required this.newsList,
    required this.title,
  }) : super(key: key);

  @override
  State<CategoryNewsList> createState() => _CategoryNewsListState();
}

class _CategoryNewsListState extends BaseViewState<CategoryNewsList> {
  late CategoryNewsListViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryNewsListViewModel>(
      viewModel: CategoryNewsListViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: widget.newsList.length,
          itemBuilder: buildNewsItem,
        ),
      ),
      onDispose: () {},
    );
  }

  Widget buildNewsItem(BuildContext context, int index) {
    INews news = widget.newsList[index];
    return Container(
      margin: context.veryLowSymPadding,
      decoration: BoxDecoration(
        borderRadius: context.veryLowRadius,
        color: context.colors.error,
      ),
      width: double.infinity,
      child: InkWell(
        onTap: () {
          context.navigate(NavigationRoute.navigateToNewsDetail(news));
        },
        child: Column(
          children: [
            Hero(
                tag: news.title + "---" + news.link,
                child: Image.network(news.imageUrl)),
            ListTile(
              title: Text(news.title),
              subtitle: Text(news.date ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
