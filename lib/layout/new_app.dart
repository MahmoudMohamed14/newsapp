import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/moduls/search/search.dart';
import 'package:newsapp/shared/componant/componant.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class NewsApp extends StatelessWidget {
  TextEditingController contril;

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<CubitApp,StatesApp>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=CubitApp.get(context);
          return Scaffold(

            body:  Padding(
              padding: const EdgeInsets.all(20),
              child:  CubitApp.get(context).screen[cubit.currentindex],
            ),
            appBar: AppBar(

              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: (){
                  navigateTo(context,SearchScreen());

                }),
                IconButton(icon: Icon(Icons.brightness_4_outlined), onPressed: (){
                  cubit.changeTheme();
                })
              ],

              title: Text('NewsApp',),
            ),

            bottomNavigationBar:BottomNavigationBar(




                currentIndex:cubit.currentindex ,
                onTap: (index){
                 cubit.changeButton(index: index);

                }
                ,

                items: [
                  BottomNavigationBarItem(icon:Icon(Icons.sports_baseball),label: 'Sport' ),
                  BottomNavigationBarItem(icon:Icon(Icons.science),label: 'Science' ),
                  BottomNavigationBarItem(icon:Icon(Icons.business),label: 'Business' ),


                ]) ,
          );
        }


    );
  }
}
