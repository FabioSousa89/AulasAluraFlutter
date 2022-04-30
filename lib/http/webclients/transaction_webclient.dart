import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient{


Future<List<Transaction>> findAll()  async {

    final Response response = await client.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 5));

    List<Transaction> transactions = _toTransactions(response);

    return transactions;
    
}

List<Transaction> _toTransactions(Response response) {
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for(Map<String, dynamic> e in decodedJson){    
    transactions.add(  Transaction.fromJson(e));
  }
  return transactions;
}

Transaction _toTransaction(Response response) {
  Map<String, dynamic> json = jsonDecode(response.body);
  
  final Map<String, dynamic> contactJson = json['contact'];
     return Transaction.fromJson(json);
}

  Future<Transaction> save(Transaction transaction) async {

    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(Uri.parse(baseUrl), headers: {'Content-type': 'application/json',
      'password': '1000'}, body: transactionJson);

    return _toTransaction(response);
  }
}


