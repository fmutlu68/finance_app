enum ExchangeCurrency { turkishLira, dollar }

extension CurrencyIconExtension on ExchangeCurrency {
  String get icon {
    switch (this) {
      case ExchangeCurrency.turkishLira:
        return "₺";
      case ExchangeCurrency.dollar:
        return "\$";
    }
  }
}
