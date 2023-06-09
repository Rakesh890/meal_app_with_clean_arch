import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';
import 'package:meal_app_with_clean_arch/infrastructure/navigation/routes.dart';

import 'controllers/search.controller.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          margin: EdgeInsets.symmetric(horizontal: 0),
          width: double.infinity,
          child: TextField(
              onChanged: (value) {
                if (value.length > 4) {
                  controller.searchWithKeywords(value);
                }
                if (value.length == 0) {
                  controller.searchWithKeywords(value);
                }
              },
              decoration: InputDecoration(
                  hintText: 'Search something',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10))),
        ),
      ),
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: controller.searchList.length,
            itemBuilder: (context, int index) {
              final searchItems = controller.searchList[index];
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAILS,
                      arguments: {'id': searchItems.idMeal});
                },
                child: buildSearhItems(searchItems),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
          ),
        ),
        onLoading: Center(child: CircularProgressIndicator()),
        onError: (error) {
          if (error == 'InvalidInputException') {
            return Text('Invalid request');
          } else if (error == 'FetchDataException') {
            return TextButton(
              child: Text(
                'Please check your internet connection.Please try again!!!',
              ),
              onPressed: () => controller.searchByKeywords(''),
            );
          } else if (error == 'BadRequestException') {
            return Text('Please check your request');
          } else {
            return Text('Something went wrong please try again $error');
          }
        },
      ),
    );
  }

  openSearchSheet(context) {
    var height = 0.0.obs;
    height.value = (MediaQuery.of(context).size.height * 0.55);
    // adjust height
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn,
        height: height.value,
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  if (height.value < 700)
                    height.value = (MediaQuery.of(context).size.height * 0.85);
                  else if (height.value > 700)
                    height.value = (MediaQuery.of(context).size.height * 0.55);
                },
                icon: Icon(Icons.horizontal_split_outlined)),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.searchList.length,
                itemBuilder: (context, int index) =>
                    buildSearhItems(controller.searchList[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildSearhItems(MealsEntity searchItems) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.network(
            searchItems.strMealThumb.toString(),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  searchItems.strMeal.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  searchItems.strInstructions.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
