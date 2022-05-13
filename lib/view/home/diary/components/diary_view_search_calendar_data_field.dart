part of '../view/diary_view.dart';

extension DiaryViewSearchCalendarDataField on _DiaryViewState {
  Widget get buildSearchField {
    return Observer(builder: (_) {
      return CustomTextField(
        textFieldProperties: TextFieldProperties(
          decoration: const InputDecoration(
              hintText: "Veri Adı",
              labelText: "Veri Ara",
              border: OutlineInputBorder(),
              isDense: true),
          onChanged: (value) {
            viewModel.searchController.text = value;
          },
          maxLines: 1,
          textController: TextEditingController(text: viewModel.searchText),
        ),
      );
    });
  }
}
