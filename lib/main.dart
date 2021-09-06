

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';
import 'layout/new_app.dart';
import 'shared/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
   await CacheHelper.init();
   bool isDark=CacheHelper.getData(key: 'isDark');
  runApp(MyApp( isDark));
}
class MyApp extends StatelessWidget {
  bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>CubitApp()..changeTheme(fromCache: isDark),

      child:  BlocConsumer<CubitApp,StatesApp>(
        listener: (context,state){},
        builder: (context,state)=>MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
        textTheme: TextTheme(bodyText1: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black)),
        appBarTheme: AppBarTheme(

          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),

              elevation: 0.0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
          ),
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),


        ),
        scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange
          ),
        //primarySwatch: Colors.deepOrangeAccent,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,

        appBarTheme: AppBarTheme(

          backgroundColor: HexColor('333739'),
            iconTheme:  IconThemeData(color: Colors.white),
          elevation: 0.0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),


        ),
        scaffoldBackgroundColor: HexColor('333739'),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor('333739'),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey
        ),
        textTheme: TextTheme(bodyText1: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))

        //primarySwatch: Colors.deepOrangeAccent,

      ),
      themeMode:CubitApp.get(context).isDark? ThemeMode.dark:ThemeMode.light,

      debugShowCheckedModeBanner: false,

      home:Directionality(
        textDirection: TextDirection.ltr,
          child: NewsApp()),
    )
    )
    );
  }
}
