part of '../view/news_view.dart';

extension HeadlineNewsIndicatorListExtension on NewsView {
  Widget _buildListIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: 20,
          width: double.infinity,
          child: Observer(
            builder: (_) => IndicatorListView(
              currentIndex: viewModel.headlineIndex,
              indicatorCount: context.read<NewsProvider>().headlines.length,
              selectedIndicatorColor: context.colors.error,
              radius: 4,
            ),
          ),
        ),
      ),
    );
  }
}
