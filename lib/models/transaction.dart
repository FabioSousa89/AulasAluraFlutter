import 'dart:convert';

import 'package:bytebank/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(
    this.value,
    this.contact,
  );

  Transaction.fromJson(Map<String, dynamic> json) :
      value = json['value'],
      contact = Contact.fromJson(json['contact']);


  Map<String, dynamic> toJson() =>
  {
    'value': value,
    'contact': contact.toJson(),
  };

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }





  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};
  
  //   result.addAll({'value': value});
  //   result.addAll({'contact': contact.toMap()});
  
  //   return result;
  // }
  
}
