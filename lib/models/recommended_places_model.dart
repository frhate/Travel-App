// RecommendedPlaceModel class definition
class RecommendedPlaceModel {
  final String name;
  final double price;
  final String image;
  final String rating;
  final String location;
  final String description;

  RecommendedPlaceModel({
    required this.rating,
    required this.location,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  // Named constructor for creating instances from a map
  RecommendedPlaceModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'].toDouble(),
        image = json['image'],
        rating = json['rating'].toDouble(),
        location = json['location'],
        description = json['description'];
}

// List of recommended places
List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    name: 'Algeria Oran',
    image: 'assets/places/oran.jpeg',
    price: 22.0,
    description: 'Oran is a place',
    rating: "4.7",
    location: "Basilique Notre Dame ",
  ),
];

// Usage example
void main() {
  print(recommendedPlaces);
}
