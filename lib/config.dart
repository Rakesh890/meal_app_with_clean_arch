class ConfigEnvironments {
  // List all Categories, Area, Ingredients
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';
  static const String categorieListUrl = '${baseUrl}list.php?c=list';
  static const String categrieWiseUrl = '${baseUrl}filter.php?c=';
  static const String areaWiseMealUrl = '${baseUrl}list.php?a=list';
  static const String mealDetailsUrl = '${baseUrl}lookup.php?i=';
  static const String mealSearchUrl = '${baseUrl}search.php?s=';
}
