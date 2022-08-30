// import 'package:finance_app/production/features/finance_data/base/model/info_model.dart';
// import 'package:finance_app/production/features/finance_data/constants/enums/url_path_enum.dart';
// import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';
// import 'package:finance_app/production/features/finance_data/models/req/crypto_info.dart';
// import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
// import 'package:finance_app/production/features/finance_data/models/req/parity_info.dart';
// import 'package:finance_app/production/features/finance_data/services/graph_data_service.dart';
// import 'package:html/dom.dart';
// import 'package:html/parser.dart';

// extension GraphParserExtension<T extends InfoModel> on GraphDataService<T> {
//   String get getMainUrl {
//     if (T == CurrencyInfo) {
//       return UrlPath.currency.path;
//     } else if (T == CommodityInfo) {
//       return UrlPath.commodity.path;
//     } else if (T == CryptoInfo) {
//       return UrlPath.crypto.path;
//     } else if (T == ParityInfo) {
//       return UrlPath.parity.path;
//     }
//     return "";
//   }
// }
