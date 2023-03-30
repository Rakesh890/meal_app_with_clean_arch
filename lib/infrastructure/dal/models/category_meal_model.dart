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
  MealsModel(
      {final String? strCategory,
      final String? strMeal,
      final String? strMealThumb,
      final String? idMeal,
      final String? strArea,
      final String? strInstructions,
      final String? strYoutube,
      final String? strTags,
      final String? strIngredient1,
      final String? strIngredient2,
      final String? strIngredient3,
      final String? strIngredient4,
      final String? strIngredient5,
      final String? strIngredient6,
      final String? strIngredient7,
      final String? strIngredient8,
      final String? strIngredient9,
      final String? strIngredient10})
      : super(
            strCategory: strCategory,
            strMealThumb: strMealThumb,
            strMeal: strMeal,
            idMeal: idMeal,
            area: strArea,
            strInstructions: strInstructions,
            strYoutube: strYoutube,
            strTags: strTags,
            strIngredient1: strIngredient1,
            strIngredient2: strIngredient2,
            strIngredient3: strIngredient3,
            strIngredient4: strIngredient4,
            strIngredient5: strIngredient5,
            strIngredient6: strIngredient6,
            strIngredient7: strIngredient7,
            strIngredient8: strIngredient8,
            strIngredient9: strIngredient9,
            strIngredient10: strIngredient10);

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    //
    return MealsModel(
        strCategory: json['strCategory'] as String?,
        strMeal: json['strMeal'] as String?,
        strMealThumb: json['strMealThumb'] as String?,
        idMeal: json['idMeal'] as String?,
        strArea: json['strArea'] as String?,
        strInstructions: json['strInstructions'],
        strTags: json['strTags'],
        strYoutube: json['strYoutube'],
        strIngredient1: json['strIngredient1'],
        strIngredient2: json['strIngredient2'],
        strIngredient3: json['strIngredient3'],
        strIngredient4: json['strIngredient4'],
        strIngredient5: json['strIngredient5'],
        strIngredient6: json['strIngredient6'],
        strIngredient7: json['strIngredient7'],
        strIngredient8: json['strIngredient8'],
        strIngredient9: json['strIngredient9'],
        strIngredient10: json['strIngredient10']);
  }
}
