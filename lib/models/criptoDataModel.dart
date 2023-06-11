class CriptoDataModel {
  final String id;
  final String symbol;
  final String name;
  final String nameid;
  final int rank;
  final double priceUsd;
  final double percentChange24h;
  final double percentChange1h;
  final double percentChange7d;
  final double priceBtc;
  final double marketCapUsd;
  final double volume24;
  final double volume24a;
  final dynamic cSupply;
  final dynamic tSupply;
  final dynamic mSupply;

  CriptoDataModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.nameid,
    required this.rank,
    required this.priceUsd,
    required this.percentChange24h,
    required this.percentChange1h,
    required this.percentChange7d,
    required this.priceBtc,
    required this.marketCapUsd,
    required this.volume24,
    required this.volume24a,
    required this.cSupply,
    required this.tSupply,
    required this.mSupply,
  });

  factory CriptoDataModel.fromJson(Map<String, dynamic> json) {
    return CriptoDataModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      nameid: json['nameid'],
      rank: json['rank'],
      priceUsd: double.parse(json['price_usd']),
      percentChange24h: double.parse(json['percent_change_24h']),
      percentChange1h: double.parse(json['percent_change_1h']),
      percentChange7d: double.parse(json['percent_change_7d']),
      priceBtc: double.parse(json['price_btc']),
      marketCapUsd: double.parse(json['market_cap_usd']),
      volume24: json['volume24'],
      volume24a: json['volume24a'],
      cSupply: json['csupply'],
      tSupply: json['tsupply'],
      mSupply: json['msupply'],
    );
  }
}