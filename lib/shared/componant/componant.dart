import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/moduls/web_view/webView.dart';

Widget editDefault({
  @required TextEditingController control
  ,double radius=30.0,
  Function onTap,
  Function onchange,

  IconData prefixIcon,
  IconData suffixIcon,
  Future validator,
  @required String label,
  bool obscureText =false,
  Function validate,
  TextInputType  texttype=TextInputType.text,
  Function presssufix



}){
  return TextFormField(
    onChanged: onchange,
    onTap:onTap ,
  decoration: InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
    prefixIcon: Icon(prefixIcon),
        suffixIcon:IconButton(icon: Icon(suffixIcon),onPressed: presssufix),
    labelText: label,



  ),
  validator: validate ,
  keyboardType: texttype,

  controller:control ,
    obscureText: obscureText,




  );

}
Widget rawcontant(
{
  Map article,context
}
    )=>InkWell(
  onTap: (){
    navigateTo(context,WebViewScreen(url:  article['url']) );
  },
      child: Padding(
  padding: const EdgeInsets.all(20),
  child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image:NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover),




          ) ,

        ),

        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${article['title']}',style: Theme.of(context).textTheme.bodyText1,maxLines: 3,overflow: TextOverflow.ellipsis,),
                SizedBox(height: 10,),
                Expanded(child: Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,)),
              ],),
          ),
        ),
        //Image.network('https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_960_720.jpg')
      ],
  ),
),
    );
Widget articleBuilder(list,{isSearch=false})=>ConditionalBuilder(
  condition:list.length>0 ,
  builder: (context)=>ListView.separated(

      physics: BouncingScrollPhysics(),
      itemBuilder:(contex,index)=> rawcontant(

          article: list[index],context: contex
      )
      , separatorBuilder:(contex,index)=>Container(width: double.infinity,height: 1,color: Colors.grey[100],) ,
      itemCount: list.length),
  fallback: (context)=>isSearch?Container():Center(child: CircularProgressIndicator()),
);
void navigateTo(context,Widget widget){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>widget));
}
