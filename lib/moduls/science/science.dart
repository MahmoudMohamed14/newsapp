import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/componant/componant.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class Science extends   StatelessWidget {
@override
Widget build(BuildContext context) {
  return BlocConsumer<CubitApp,StatesApp>(
    listener: (context,state){},
    builder: (context,state){
      var cubit=CubitApp.get(context);
      var list=cubit.scienceArticle;
      return articleBuilder(list);
    },

  );
}
}

