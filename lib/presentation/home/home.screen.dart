import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';
import 'package:meal_app_with_clean_arch/infrastructure/navigation/routes.dart';
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                backgroundColor: Colors.amber,
                label: Text('${catItems.strCategory}'),
                autofocus: true,
              ),
            ),
          );
        });
  }

  buildIngridentsCategory() {
    return GridView.builder(
        itemCount: controller.ingriedentsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.84),
        itemBuilder: (context, int index) {
          final catItems = controller.ingriedentsList[index];
          return InkResponse(
            onTap: () {
              Get.toNamed(Routes.DETAILS, arguments: {'id': catItems.idMeal});
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    '${catItems.strMealThumb}',
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        "https://developers.elementor.com/path/to/placeholder.png",
                        fit: BoxFit.fitWidth,
                      );
                    },
                    height: 180,
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

  buidSelectAreaDropDown() {
    return Obx(
      () => DropdownButton(
        // Initial Value
        value: controller.selectedCityValue.value,
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: (value) {
          controller.selectedCityValue(value as String?);
        },
        iconEnabledColor: Colors.white,
        isDense: true,
        items: controller.cityList.map((items) {
          return DropdownMenuItem(
            value: items.area,
            child: Text(items.area.toString(),
                style: TextStyle(color: Colors.black, fontSize: 15.0)),
          );
        }).toList(),
      ),
    );
  }
}
