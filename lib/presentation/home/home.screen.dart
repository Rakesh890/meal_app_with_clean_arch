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
        body: controller.obx((state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                child: buildMealCategory(),
              ),
              Expanded(child: buildIngridentsCategory()),
            ],
          );
        },
            onError: (err) => Center(
                  child: Text(err.toString()),
                ),
            onLoading: Center(
              child: CircularProgressIndicator(),
            )));
  }

  buildMealCategory() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoryList.length,
        itemBuilder: (context, int index) {
          final catItems = controller.categoryList[index];
          return InkResponse(
            onTap: () => controller.selectCategories(catItems),
            child: Chip(
              label: Text('${catItems.strCategory}'),
              autofocus: true,
            ),
          );
        });
  }

  buildIngridentsCategory() {
    return GridView.builder(
        itemCount: controller.ingriedentsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.85),
        itemBuilder: (context, int index) {
          final catItems = controller.ingriedentsList[index];
          return InkResponse(
            onTap: () {},
            child: Card(
              child: Column(
                children: [
                  FadeInImage.assetNetwork(
                    placeholder: AutofillHints.birthdayYear,
                    image: '${catItems.strMealThumb}',
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${catItems.strMeal}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
