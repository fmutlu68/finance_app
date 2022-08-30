enum ExchangeCurrency {
  turkishLira(icon: "₺", symbol: "TRY"),
  dollar(icon: "\$", symbol: "USD"),
  euro(icon: "€", symbol: "EUR"),
  sterlin(icon: "£", symbol: "GBP");

  final String icon;
  final String symbol;
  const ExchangeCurrency({required this.icon, required this.symbol});
}
