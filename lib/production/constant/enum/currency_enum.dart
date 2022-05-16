enum ExchangeCurrency { turkishLira, dollar }

extension CurrencySymbolExtension on ExchangeCurrency {
  String get icon {
    switch (this) {
      case ExchangeCurrency.turkishLira:
        return "₺";
      case ExchangeCurrency.dollar:
        return "\$";
    }
  }

  String get symbol {
    switch (this) {
      case ExchangeCurrency.turkishLira:
        return "TRY";
      case ExchangeCurrency.dollar:
        return "USD";
    }
  }
}
