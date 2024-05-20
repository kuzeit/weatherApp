
import 'package:get/get.dart';
import 'package:weatherapp/screens/home_screen.dart';

import '../constant/routes.dart';
import '../middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [

   GetPage(name: "/", page: () =>   HomeScreen()),


//  Auth
   ];
