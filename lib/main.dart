import 'package:flutter/material.dart';
import 'package:plantshop/utils/theme.dart';

import 'pages/home/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plants App',
      debugShowCheckedModeBanner: false,
      theme: ThemeStyle.themeDta(),
      home:const HomePage(),
    );
  }
}