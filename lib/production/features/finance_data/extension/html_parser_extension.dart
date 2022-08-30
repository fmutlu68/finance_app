import 'package:finance_app/production/features/finance_data/base/i_data_service.dart';

extension HtmlParserExtension on IDataService {
  String parseHtml(String html) {
    html = html.replaceAll("\n", "");
    html = html.replaceAll("\t", "");
    html = html.replaceAll("  ", "");
    return html;
  }
}
