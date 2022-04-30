
import 'dart:convert';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'interceptors/logging_interceptor.dart';


final Client client =    InterceptedClient.build(
      interceptors: [LoggingInterceptor()]
    );

const String baseUrl = "http://192.168.86.22:8080/transactions";


