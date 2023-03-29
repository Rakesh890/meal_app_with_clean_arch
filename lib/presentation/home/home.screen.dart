import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeScreen'),
          centerTitle: true,
        ),
        body: controller.obx(
            (state) {
              return ListView.builder(
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    return Text(
                        "${controller.categoryList[index].strCategory}");
                  });
            },
            onLoading: CircularProgressIndicator(),
            onError: ((error) {
              return Text(error.toString());
            })));
  }
}
