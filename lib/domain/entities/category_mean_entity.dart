import 'package:equatable/equatable.dart';
import 'package:meal_app_with_clean_arch/infrastructure/dal/models/category_meal_model.dart';

class CategoryMealEntity extends Equatable {
  final List<MealsEntity> meals;

  CategoryMealEntity({
    required this.meals,
  });

  @override
  List<Object?> get props => [meals];
}

class MealsEntity extends Equatable {
  final String? strCategory;
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;
  final String? area;
  final String? strInstructions;
  final String? strYoutube;
  String? strTags;
  String? strIngredient2;
  String? strIngredient1;
  String? strIngredient3;
  String? strIngredient5;
  String? strIngredient4;
  String? strIngredient6;
  String? strIngredient8;
  String? strIngredient7;
  String? strIngredient10;
  String? strIngredient9;

  MealsEntity(
      {this.strCategory,
      this.strMeal,
      this.strMealThumb,
      this.idMeal,
      this.area,
      this.strInstructions,
      this.strYoutube,
      this.strTags,
      this.strIngredient2,
      this.strIngredient1,
      this.strIngredient3,
      this.strIngredient5,
      this.strIngredient4,
      this.strIngredient6,
      this.strIngredient8,
      this.strIngredient7,
      this.strIngredient10,
      this.strIngredient9});

  @override
  List<Object?> get props => [
        strCategory,
        strMeal!,
        strMealThumb!,
        idMeal!,
        area!,
        strInstructions!,
        strYoutube!,
        strIngredient1!,
        strIngredient2!,
        strIngredient3!,
        strIngredient4!,
        strIngredient5!,
        strIngredient6!,
        strIngredient7!,
        strIngredient8!,
        strIngredient9,
        strIngredient10
      ];
}
