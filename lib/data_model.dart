class QuoteModel {
  int id;
  String quote;
  String author;

  QuoteModel({required this.id, required this.quote, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      QuoteModel(id: json['id'], quote: json['quote'], author: json['author']);
}

class DataModel {
  int limit;
  int skip;
  int total;
  List<QuoteModel> quotes;

  DataModel({
    required this.limit, 
  required this.skip, 
  required this.total, 
  required this.quotes});


  factory DataModel.fromJson(Map<String, dynamic> json) {

    List<QuoteModel> mQuotes = [];

    for(Map<String, dynamic> eachQuote in json['quotes']){
      mQuotes.add(QuoteModel.fromJson(eachQuote));
    }

    return DataModel(limit: json['limit'], skip: json['skip'], total: json['total'], quotes: mQuotes);
  }
}
