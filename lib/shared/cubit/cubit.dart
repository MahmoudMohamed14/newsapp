
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/moduls/business/business.dart';
import 'package:newsapp/moduls/science/science.dart';
import 'package:newsapp/moduls/search/search.dart';
import 'package:newsapp/moduls/setting/setting.dart';
import 'package:newsapp/moduls/sports/sports.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

class CubitApp extends Cubit<StatesApp>{
  bool scure=true;
  IconData sufixIcon=Icons.visibility_off;

  int currentindex=0;
  List<Widget> screen=[Sport(), Science(), Business(),Setting()];

  CubitApp( ) : super(InitStatesApp());
  static CubitApp get(context){
    return BlocProvider.of(context);
  }
  void changeButton({@ required int index}){
    currentindex=index;
    if(currentindex==1){
      getScienceData();
    }else if(currentindex==0){
      getSportsData();
    }else if(currentindex==2){
      getBusinessData();
    }
    emit(ChangeButtonStatesApp());

  }
  void passwordvisable(){
    if(scure){

      sufixIcon=Icons.visibility;

    }else{

      sufixIcon=Icons.visibility_off;


    }
    scure=!scure;
    emit(PasswordStatesApp());


  }
  List<dynamic>businessArticle=[];
  void getBusinessData(){
    emit(LoadingBusinessStatesApp());
    if(businessArticle.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query:{'country':'eg','category':'business','apiKey':'38e16638b3df4fe8992688b8917b98c2'}).then((value) {

        businessArticle=value.data['articles'];
        print(businessArticle);
        emit(GetDataBusinessSuccessStatesApp());

      }).catchError((error){
        print('get error '+error.toString());
        emit(GetDataBusinessErrorStatesApp(error: error.toString()));

      });
    }else
      emit(GetDataBusinessSuccessStatesApp());




  }
  List<dynamic>scienceArticle=[];
  void getScienceData(){
    emit(LoadingScienceStatesApp());
    if(scienceArticle.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query:{'country':'eg','category':'science','apiKey':'38e16638b3df4fe8992688b8917b98c2'}).then((value) {

        scienceArticle=value.data['articles'];
        print(scienceArticle);
        emit(GetDataScienceSuccessStatesApp());

      }).catchError((error){
        print('get error '+error.toString());
        emit(GetDataScienceErrorStatesApp(error: error.toString()));

      });
    }else
      emit(GetDataScienceSuccessStatesApp());



  }
  List<dynamic>sportsArticle=[];
  void getSportsData(){
    emit(LoadingSportsStatesApp());
    if(sportsArticle.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query:{'country':'eg','category':'sports','apiKey':'38e16638b3df4fe8992688b8917b98c2'}).then((value) {

        sportsArticle=value.data['articles'];
        print(sportsArticle);
        emit(GetDataSportsSuccessStatesApp());

      }).catchError((error){
        print('get error '+error.toString());
        emit(GetDataSportsErrorStatesApp(error: error.toString()));

      });

    }else{
      emit(GetDataSportsSuccessStatesApp());

    }



  }
  List<dynamic>searchArticle=[];
  void getSearchData( String value){
    emit(LoadingSearchStatesApp());


      DioHelper.getData(url: 'v2/everything', query:{'q':'$value','apiKey':'38e16638b3df4fe8992688b8917b98c2'}).then((value) {

        searchArticle=value.data['articles'];
        print(searchArticle);
        emit(GetDataSearchSuccessStatesApp());

      }).catchError((error){
        print('get error '+error.toString());
        emit(GetDataSearchErrorStatesApp(error: error.toString()));

      });





  }

  bool isDark=false;
  void changeTheme({bool fromCache}) {
    if (fromCache != null) {
      isDark = fromCache;
      emit(ChangeThemeStatesApp());
    } else {
      isDark = !isDark;

      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeThemeStatesApp());
      });
    }
  }




}