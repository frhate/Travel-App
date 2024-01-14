import 'package:flutter/material.dart';
import 'package:travel_app/managers/recommended_places_manager.dart';
import 'package:travel_app/models/recommended_places_model.dart';

class RecommendedPlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Places'),
      ),
      body: ListView.builder(
        itemCount: RecommendedPlacesManager.recommendedPlaces.length,
        itemBuilder: (context, index) {
          RecommendedPlaceModel place = RecommendedPlacesManager.recommendedPlaces[index];

          return ListTile(
            title: Text(place.name),
            subtitle: Text(place.location),
            // Add other widgets to display additional information
          );
        },
      ),
    );
  }
}
