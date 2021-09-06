import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/componant/componant.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp,StatesApp>(
      listener: (context,state){},
      builder: (context,state){
        var list=CubitApp.get(context).searchArticle;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: editDefault(
                  onchange: (  value){


                    CubitApp.get(context).getSearchData(value);

                  },
                    control: searchController,
                    label:'search'
                    ,validate: ( String value){
                  if(value.isEmpty){
                    return'search must be not empty';
                  }
                  return null;

                },
                    prefixIcon: Icons.search
                ),
              ),
              SizedBox(height: 20,),
              Expanded(child: articleBuilder(list,isSearch: true),)

            ],
          ),
        );
      }
    );
  }
}
