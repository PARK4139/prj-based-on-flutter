// import 'dart:async';
// import 'dart:convert';
//
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dio/dio.dart';
//
// import '../../../helpers/super_helper.dart';
// import 'package:chopper/chopper.dart';
//
//
// part 'my_api.chopper.dart';
//
//
// @ChopperApi(baseUrl: '<https://jsonplaceholder.typicode.com>')
// abstract class MyApi extends ChopperService {
//   static MyApi create([ChopperClient? client]) => _$MyApi(client);
//
//   @Get(path: '/todos/{id}')
//   Future<response> getTodoById(@Path() int id);
//
//   @Post(path: '/posts')
//   Future<response> createPost(@Body() Map<string, dynamic=""> data);
// }
//
// // Chopper 생성
// var chopper = ChopperClient(
//   baseUrl: '<https://jsonplaceholder.typicode.com>',
//   services: [
//     MyApi.create(),
//   ],
// );
//
// // GET 요청
// var response = await chopper.get('/todos/1');
// print(response.body?.title);
//
// // POST 요청
// var response = await chopper.post('/posts', body: {'title': 'foo', 'body': 'bar', 'userId': '1'});
// print(response.body?.id);
// </string,></response</response
