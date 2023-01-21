import 'package:flutter/material.dart';

navigateToNextPage(BuildContext context, Widget widget, {bool back = true}){
  if(back){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>widget));
  }else{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>widget));
  }
}


Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
