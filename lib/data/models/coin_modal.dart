class CoinModel {
  late final Status status;
  late final List<Data> data;

  CoinModel({required this.status, required this.data});

  CoinModel.fromJson(Map<String, dynamic> json) {
    status =
        (json['status'] != null ? new Status.fromJson(json['status']) : null)!;

    if (json['data'] != null) {
      data = <Data>[];

      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }
}

class Status {
  late final String timestamp;
  late final int errorCode;
  late final Null errorMessage;
  late final int elapsed;
  late final int creditCount;
  late final Null notice;
  late final int totalCount;

  Status(
      {required this.timestamp,
      required this.errorCode,
      this.errorMessage,
      required this.elapsed,
      required this.creditCount,
      this.notice,
      required this.totalCount});

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
    notice = json['notice'];
    totalCount = json['total_count'];
  }
}

class Data {
  late final int id;
  late final String name;
  late final String symbol;
  late final String slug;
  late final int numMarketPairs;
  late final String dateAdded;
  late final List<String> tags;
  late final double? maxSupply;
  late final double? circulatingSupply;
  late final double? totalSupply;
  late final Object? platform;
  late final int cmcRank;
  late final String lastUpdated;
  late final Quote quote;

  Data(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.slug,
      required this.numMarketPairs,
      required this.dateAdded,
      required this.tags,
      required this.maxSupply,
      required this.circulatingSupply,
      required this.totalSupply,
      required this.platform,
      required this.cmcRank,
      required this.lastUpdated,
      required this.quote});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();
    maxSupply = json['max_supply'] == null ? 0 : json['max_supply'].toDouble();
    circulatingSupply = json['circulating_supply'].toDouble();
    totalSupply = json['total_supply'].toDouble();
    platform = json['platform'];
    cmcRank = json['cmc_rank'];
    lastUpdated = json['last_updated'];
    quote = (json['quote'] != null ? Quote.fromJson(json['quote']) : null)!;
  }
}

class Quote {
  late final USD uSD;
  Quote({required this.uSD});
  Quote.fromJson(Map<String, dynamic> json) {
    uSD = (json['USD'] != null ? USD.fromJson(json['USD']) : null)!;
  }
}

class USD {
  late final double? price;
  late final double? volume24h;
  late final double? volumeChange24h;
  late final double? percentChange1h;
  late final double? percentChange24h;
  late final double? percentChange7d;
  late final double? percentChange30d;
  late final double? percentChange60d;
  late final double? percentChange90d;
  late final double? marketCap;
  late final double? marketCapDominance;
  late final double? fullyDilutedMarketCap;
  late final String lastUpdated;

  USD(
      {required this.price,
      required this.volume24h,
      required this.volumeChange24h,
      required this.percentChange1h,
      required this.percentChange24h,
      required this.percentChange7d,
      required this.percentChange30d,
      required this.percentChange60d,
      required this.percentChange90d,
      required this.marketCap,
      required this.marketCapDominance,
      required this.fullyDilutedMarketCap,
      required this.lastUpdated});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'].toDouble();
    volume24h = json['volume_24h'].toDouble();
    volumeChange24h = json['volume_change_24h'].toDouble();
    percentChange1h = json['percent_change_1h'].toDouble();
    percentChange24h = json['percent_change_24h'].toDouble();
    percentChange7d = json['percent_change_7d'].toDouble();
    percentChange30d = json['percent_change_30d'].toDouble();
    percentChange60d = json['percent_change_60d'].toDouble();
    percentChange90d = json['percent_change_90d'].toDouble();
    marketCap = json['market_cap'].toDouble();
    marketCapDominance = json['market_cap_dominance'].toDouble();
    fullyDilutedMarketCap = json['fully_diluted_market_cap'].toDouble();
    lastUpdated = json['last_updated'];
  }
}
