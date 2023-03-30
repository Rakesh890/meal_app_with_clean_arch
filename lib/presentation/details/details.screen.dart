import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/core/error/app_exceptions.dart';

import 'controllers/details.controller.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${controller.mealsEntity.strMeal ?? ''}'),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) {
            return ListView(
              children: [
                Image.network(controller.mealsEntity.strMealThumb.toString()),
                Text(
                  '${controller.mealsEntity.strMeal ?? ''}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Text(
                  '${controller.mealsEntity.strInstructions}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Text("Watch video")),
                    ElevatedButton(
                        onPressed: () {}, child: Text("See Ingridents"))
                  ],
                )
              ],
            );
          },
          onLoading: LinearProgressIndicator(),
          onError: (error) {
            if (error == 'InvalidInputException') {
              return Text('Invalid request');
            } else if (error == 'FetchDataException') {
              return TextButton(
                child: Text(
                  'Please check your internet connection.Please try again!!!',
                ),
                onPressed: () => controller.getMealDetail(controller.idMeal),
              );
            } else if (error == 'BadRequestException') {
              return Text('Please check your request');
            } else {
              return Text('Something went wrong please try again');
            }
          },
        ));
  }
}
