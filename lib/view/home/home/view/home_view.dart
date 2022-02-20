import 'package:finance_app/core/base/widget/base_view.dart';
import 'package:finance_app/view/home/components/home_bottom_bar.dart';
import 'package:finance_app/view/home/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onWillPop: () async {
        bool exCloseable = viewModel.appCloseable;
        if (!exCloseable && viewModel.navigatorKey.currentState!.canPop()) {
          viewModel.navigatorKey.currentState!.pop();
          viewModel.setNewIndexAfterPop();
          if (!viewModel.navigatorKey.currentState!.canPop()) {
            viewModel.setCloseable(true);
          }
          return false;
        }
        return viewModel.currentRoute?.isFirst == true ||
            exCloseable == viewModel.appCloseable && exCloseable == true;
      },
      onPageBuilder: (context, model) => Scaffold(
        body: Navigator(
          key: viewModel.navigatorKey,
          observers: [viewModel.homeViewObserver],
          onGenerateRoute: viewModel.generateRoute,
        ),
        bottomNavigationBar: Observer(
          builder: (_) => HomeBottomBar(
            onPageChanged: viewModel.onPageChanged,
            selectedPageIndex: viewModel.selectedPage,
          ),
        ),
      ),
      onDispose: () {},
    );
  }
}
