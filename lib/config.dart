class ConfigEnvironments {
  // List all Categories, Area, Ingredients
  static const String BASEURL = "https://www.themealdb.com/api/json/v1/1/";
  static const String categorieListUrl = BASEURL + "list.php?c=list";
  static const String ingredientsUrl = BASEURL + "list.php?i=list";
  static const String categrieWiseUrl = BASEURL+"filter.php?c=";
}
