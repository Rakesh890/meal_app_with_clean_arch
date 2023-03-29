import 'package:equatable/equatable.dart';
import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';

class CategoryMealModel extends CategoryMealEntity with EquatableMixin {
  CategoryMealModel({required meals}) : super(meals: meals);

  factory CategoryMealModel.fromJson(Map<String, dynamic> json) {
    return CategoryMealModel(
        meals: (json['meals'] as List?)
            ?.map((dynamic e) => MealsModel.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

class MealsModel extends MealsEntity with EquatableMixin {
  MealsModel({required String? strCategory}) : super(strCategory: strCategory!);

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(strCategory: json['strCategory'] as String?);
  }
}
