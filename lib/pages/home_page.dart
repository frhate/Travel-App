import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travel_app/pages/search_page.dart';
import 'package:travel_app/pages/post_page.dart';
import 'package:travel_app/widgets/custom_icon_button.dart';
import 'package:travel_app/widgets/location_card.dart';
import 'package:travel_app/widgets/nearby_places.dart';
import 'package:travel_app/widgets/recommended_places.dart';
import 'package:travel_app/widgets/tourist_places.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  void onViewAllRecommendations(BuildContext context) {
    print("View All Recommendations");
  }

  void onViewAllNearby(BuildContext context) {
    print("View All Nearby");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Good Morning"),
            Text(
              "Mr. Adventurer",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
       actions: [
GestureDetector(
  onTap: () {
    print("Search button pressed");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage()),
    );
  },
  child: Icon(Ionicons.search_outline),
),
  Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 12),
    child: CustomIconButton(
      icon: Icon(Ionicons.notifications_outline),
    ),
  ),
],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const LocationCard(),
          const SizedBox(
            height: 15,
          ),
          const TouristPlaces(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendation",
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () => onViewAllRecommendations(context),
                child: const Text("View All"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const RecommendedPlaces(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nearby From You",
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () => onViewAllNearby(context),
                child: const Text("View All"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const NearbyPlaces(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.bookmark_outline),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.add_circle_outline),
            label: "Ticket",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
          )
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              // Already on the home page
              break;
            case 1:
              // Navigate to Bookmark page.
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostFormPage()),
              );
              break;
            case 3:
              // Navigate to Profile page.
              break;
          }
        },
      ),
    );
  }
}
