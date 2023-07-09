import 'package:flutter/material.dart';

class GlobalMethods{
  static navigateTo({required BuildContext ctx, required routeName}){
    Navigator.pushNamed(ctx, routeName);

  }
}