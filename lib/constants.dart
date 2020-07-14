import 'package:flutter/material.dart';
const String kApikey = 'fba760f2bc4b58121aeb6a3bbbb72318';
const KInputDecoration = InputDecoration(
  suffixIcon: IconButton(onPressed: null,icon: Icon(Icons.search),),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter The City Name',
  hintStyle: TextStyle(
      color: Colors.grey
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none
  ),
);