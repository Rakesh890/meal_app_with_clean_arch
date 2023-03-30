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

  MealsModel({
     final String? strCategory,
      final String? strMeal,
      final String? strMealThumb,
     final String? idMeal, }) : super(
    strCategory: strCategory,
  strMealThumb: strMealThumb,
  strMeal: strMeal,
  idMeal: idMeal);

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    //
    return MealsModel(
      strCategory: json['strCategory'] as String?,
    strMeal : json['strMeal'] as String?,
    strMealThumb : json['strMealThumb'] as String?,
    idMeal : json['idMeal'] as String?,);
  }
}
