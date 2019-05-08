import 'package:flutter/material.dart';
import 'app/application.dart';

class EbookApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.lightBlue,
        iconTheme: IconThemeData(color: Colors.lightBlue)
      ),
      child: MaterialApp(
        title: 'EbookApp',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(primaryColor: Colors.lightBlue),
      )
    );
  }
}