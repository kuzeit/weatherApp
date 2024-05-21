
import 'package:get/get.dart';
import 'package:weatherapp/screens/home_screen.dart';

import '../../screens/searchPge.dart';
import '../constant/routes.dart';

List<GetPage<dynamic>>? routes = [

   GetPage(name: "/", page: () =>   HomeScreen()),

   GetPage(name: AppRoute.searchPage, page: () =>   searchPage()),

//  Auth
   ];
