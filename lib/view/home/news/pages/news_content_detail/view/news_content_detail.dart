import 'package:finance_app/core/extensions/dynamic_size_extension.dart';
import 'package:finance_app/core/extensions/spacer_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/news_detail.dart';
import 'package:finance_app/production/notifiers/news_provider.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';
import 'package:provider/provider.dart';

class NewsContentDetail extends StatefulWidget {
  final INews news;
  const NewsContentDetail({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  State<NewsContentDetail> createState() => _NewsContentDetailState();
}

class _NewsContentDetailState extends State<NewsContentDetail> {
  NewsDetail? detail;
  @override
  void initState() {
    context.read<NewsProvider>().getNewsDetail(widget.news).then((value) {
      setState(() {
        detail = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildNewsImage(),
          buildInfoTile(),
          ...buildContent(),
        ],
      ),
    );
  }

  SizedBox buildNewsImage() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Hero(
        tag: widget.news.link,
        child: Image.network(widget.news.imageUrl, fit: BoxFit.fill),
      ),
    );
  }

  buildInfoTile() {
    return ListTile(
      dense: true,
      leading: const BackButton(),
      trailing: buildNewsDateText,
    );
  }

  get buildNewsDateText =>
      widget.news.date?.isEmpty ?? false || widget.news.date == null
          ? const SizedBox()
          : Text(
              widget.news.date!,
              style: context.textTheme.subtitle1
                  ?.copyWith(color: context.colors.primary),
            );

  List<Widget> buildContent() {
    return detail == null
        ? [
            const Center(
              child: CircularProgressIndicator(),
            )
          ]
        : [buildTitle(), context.veryLowHeightSpacer, ...buildContentTexts()];
  }

  buildTitle() {
    return Text(
      detail!.longTitle,
      style: context.textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }

  buildContentTexts() {
    return detail!.contentList.map<Widget>((e) => buildContentText(e)).toList();
  }

  buildContentText(String content) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: context.calculateDynamicHeight(0.8),
          left: context.veryLowWidth),
      child: Text(content, style: context.textTheme.subtitle2),
    );
  }
}
