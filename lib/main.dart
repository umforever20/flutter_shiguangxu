
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shiguangxu/page/home_page/home_page.dart';
import 'package:flutter_shiguangxu/page/login_page/LoginPage.dart';
import 'package:flutter_shiguangxu/page/other_custom_page/presenter/OtherPresenter.dart';
import 'package:flutter_shiguangxu/page/welcome_page/welcome_page.dart';

import 'package:flutter_sqlite_orm/db_manager.dart';
import 'package:provider/provider.dart';
import 'common/Constant.dart';
import 'utils/HttpUtils.dart';

void main() async {
  http();
  await _initDataBase();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: OtherPresenter(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {



    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: HomePage(),
          ),
        ));
  }
}

void _initDataBase() async {

  await DBManager.getInstance().init(Constant.DB_VERSION, Constant.DB_NAME);

}

Future http() async{
  LogUtil.e("执行  http ----------------->");
  HttpUtils.getInstance().get("/login",data:{"id":"111111111111"} );
}
