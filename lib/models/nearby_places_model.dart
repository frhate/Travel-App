// ignore_for_file: public_member_api_docs, sort_constructors_first

class NearbyPlaceModel {
  final String image;
  final String des;
  final String rating;
  final String location;


  NearbyPlaceModel({
   required this.image,
   required this.des,
   required this.rating,
   required this.location,
   
   });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    image: "assets/places/oran.jpeg",
    des: "Basilique Notre Dame",
    location: 'Alger',
    rating: '4.5',
  ),
  NearbyPlaceModel(
    image: "assets/places/constantine.jpeg",
    des: "Constantine Qentra ",
    location: 'Constantine',
    rating: '4.7',
  ),
  NearbyPlaceModel(
    image: "assets/places/snata cruz.jpeg",
    des: "Oran Sanata Cruz",
    location: 'Oran',
    rating: '4.3',
  ),
  NearbyPlaceModel(
    image: "assets/places/casbah.jpeg",
    des: "Alger Casbah",
    location: 'Alger',
    rating: '4.5',
  ),
  NearbyPlaceModel(
    image: "assets/places/jardine.jpeg",
    des: "Jardin D'essai Alger",
    location: 'Alger',
    rating: '4.5',
  ),
  NearbyPlaceModel(
    image: "assets/places/oran.jpeg",
    des: "Basilique Notre Dame",
    location: 'Oran',
    rating: '4.3',
  ),
  NearbyPlaceModel(
    image: "assets/places/constantine.jpeg",
    des: "Constantine Qentra",
    location: 'Constantine',
    rating: '4.5',
  ),
];
