import 'package:flutter/material.dart';

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

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<NearbyPlaceModel> _allNearbyPlaces = [
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

  List<NearbyPlaceModel> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            _buildSearchResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        labelText: 'Search',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            _performSearch();
          },
        ),
      ),
    );
  }

  void _performSearch() {
    String searchTerm = _searchController.text.toLowerCase();

    List<NearbyPlaceModel> searchResults = _allNearbyPlaces
        .where((place) =>
            place.des.toLowerCase().contains(searchTerm) ||
            place.location.toLowerCase().contains(searchTerm))
        .toList(); // Convert to List

    setState(() {
      _searchResults = searchResults;
    });
  }

  Widget _buildSearchResults() {
    return Expanded(
      child: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_searchResults[index].des),
            subtitle: Text(_searchResults[index].location),
           
          );
        },
      ),
    );
  }
}
