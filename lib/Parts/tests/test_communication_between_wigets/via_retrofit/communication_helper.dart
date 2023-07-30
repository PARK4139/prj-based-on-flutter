import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'communication_helper.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/tasks")
  Future<List<TaskToDo>> getTasksToDo();

  @GET("/tasks/{id}")
  Future<TaskToDo> getTaskToDo(@Path("id") String id);

  // @GET('/demo')
  // Future<String> queries(@Queries() Map<String, dynamic> queries);
  //
  // @GET("https://httpbin.org/get")
  // Future<String> namedExample(
  //     @Query("apikey") String apiKey,
  //     @Query("scope") String scope,
  //     @Query("type") String type,
  //     @Query("from") int from
  //     );

  @PATCH("/tasks/{id}")
  Future<TaskToDo> updateTaskToDoPart(
      @Path() String id, @Body() Map<String, dynamic> map);

  @PUT("/tasks/{id}")
  Future<TaskToDo> updateTaskToDo(@Path() String id, @Body() TaskToDo task);

  @DELETE("/tasks/{id}")
  Future<void> deleteTaskToDo(@Path() String id);

  @POST("/tasks")
  Future<TaskToDo> createTaskToDo(@Body() TaskToDo task);

  @POST("http://httpbin.org/post")
  Future<void> createNewTaskToDoFromFile(@Part() File file);

  @POST("http://httpbin.org/post")
  @FormUrlEncoded()
  Future<String> postUrlEncodedFormData(@Field() String hello);
}

@JsonSerializable()
class TaskToDo {
  String? id;
  String? name;
  String? avatar;
  String? createdAt;

  TaskToDo({this.id, this.name, this.avatar, this.createdAt});

  factory TaskToDo.fromJson(Map<String, dynamic> json) => _$TaskToDoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToDoToJson(this);
}

// # dart
// dart pub run build_runner build



// # flutter
// flutter pub run build_runner build
// deprecated
//     dart run build_runner build
