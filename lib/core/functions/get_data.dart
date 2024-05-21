import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/class/statusrequest.dart';
import 'package:weatherapp/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
getdata(String AppLink) async {
  var response = await getDataResponse(AppLink);
  return response.fold((l) => l, (r) => r);
}

Future<Either<StatusRequest, Map>> getDataResponse(String linkurl) async {
  if (await checkInternet()) {
    var response = await http.get(Uri.parse(linkurl));
    print(response.statusCode) ;

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      print(responsebody) ;

      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  } else {
    return const Left(StatusRequest.offlinefailure);
  }

}
