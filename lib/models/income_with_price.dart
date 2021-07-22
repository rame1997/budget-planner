import 'package:badgetplanner/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
String date=DateFormat.MMMd('en').format(DateTime.now());

List<HomeItem> dataIncomeWithPrice = [
  HomeItem( title: 'Food', icon: Icons.note, date:date , money: '-\$223', subTitle: 'Pizza Day', onTap: () {  }, priveousDate: 'Jul 14', ic_ex: 1,),
  HomeItem( title: 'Travel', icon: Icons.note, date:date , money: '-\$223', subTitle: 'Pizza Day', onTap: () {  }, priveousDate: 'Jul 14',ic_ex: 2,),
  HomeItem( title: 'Medicine', icon: Icons.note, date:date , money: '+ \$73', subTitle: 'Pizza Day', onTap: () {  }, priveousDate: date,ic_ex: 1,),
  HomeItem( title: 'Accommodation', icon: Icons.note, date:date , money: '-\$223', subTitle: 'Pizza Day', onTap: () {  }, priveousDate: 'Jul 13',ic_ex: 1,),
  HomeItem( title: 'Food', icon: Icons.note, date:date , money: '-\$223', subTitle: 'Pizza Day', onTap: () {  }, priveousDate: 'Jul 14',ic_ex: 2,),
  HomeItem( title: 'Travel', icon: Icons.note, date:date , money: '-\$223', subTitle: 'Pizza Day', onTap: () {  }, priveousDate: 'Jul 14',ic_ex: 1,),
  HomeItem( title: 'Accommodation', icon: Icons.note, date:date , money: '-\$223', subTitle: 'Pizza Day', onTap: () {  }, priveousDate: 'Jul 13',ic_ex: 1,),
  HomeItem( title: 'Medicine', icon: Icons.note, date:date , money: '+ \$73', subTitle: 'Pizza Day', onTap: () {  }, priveousDate: date,ic_ex: 2,),


];