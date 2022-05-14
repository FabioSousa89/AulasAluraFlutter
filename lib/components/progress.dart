import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({
    Key? key,
    this.message = 'Loading',
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [              
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(message, style: TextStyle(fontSize: 16),),
                    ),
                  ],
                ),
              );
  }
}
