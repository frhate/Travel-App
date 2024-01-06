// recommended_places_manager.dart

import 'package:travel_app/models/recommended_places_model.dart';

class RecommendedPlacesManager {
  static List<RecommendedPlaceModel> recommendedPlaces = [];

  static void addRecommendedPlace(RecommendedPlaceModel place) {
    recommendedPlaces.add(place);
  }
}