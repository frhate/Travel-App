import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/models/recommended_places_model.dart';
import 'package:travel_app/managers/recommended_places_manager.dart';
import 'package:travel_app/widgets/imageInputWidget.dart';

class PostFormPage extends StatefulWidget {
  const PostFormPage({super.key});

  @override
  _PostFormPageState createState() => _PostFormPageState();
}

class _PostFormPageState extends State<PostFormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Image'),
            ImageInputWidget(
              onImageSelected: (path) {
                setState(() {
                  imagePath = path;
                });
              },
            ),

            const Text('Name'),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter place name',
              ),
            ),

            const Text('Price'),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter place price',
              ),
            ),

            const Text('Rating'),
            TextField(
              controller: ratingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter place rating (0.0 to 5.0)',
              ),
            ),

            const Text('Location'),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                hintText: 'Enter place location',
              ),
            ),

            const Text('Description'),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter place description',
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    // Validate form data
    if (nameController.text.isEmpty ||
        locationController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        imagePath.isEmpty) {
      // Show an error message or provide feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields and select an image.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double price = double.tryParse(priceController.text) ?? 0.0;
    double rating = double.tryParse(ratingController.text) ?? 0.0;

    if (price < 0 || price > 100 || rating < 0 || rating > 5) {
      // Show an error message or provide feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid price or rating.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Debug prints for checking form data
    print('Name: ${nameController.text}');
    print('Price: $price');
    print('Image: $imagePath');
    print('Rating: $rating');
    print('Location: ${locationController.text}');
    print('Description: ${descriptionController.text}');

    // Create an instance of RecommendedPlaceModel and populate it with form data
    RecommendedPlaceModel place = RecommendedPlaceModel(
      name: nameController.text,
      price: price,
      image: imagePath,
      rating: rating.toString(),
      location: locationController.text,
      description: descriptionController.text,
    );

    // Add the new place to the recommendedPlaces list in the manager
    RecommendedPlacesManager.addRecommendedPlace(place);

    // Provide feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Place submitted successfully.'),
        backgroundColor: Colors.green,
      ),
    );

    // Clear form fields and image path after submitting
    nameController.clear();
    priceController.clear();
    ratingController.clear();
    locationController.clear();
    descriptionController.clear();
    setState(() {
      imagePath = '';
    });
  },
  child: const Text('Submit'),
),
          ],
        ),
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
          // Handle navigation based on the tapped icon index.
          switch (index) {
            case 0:
              // Navigate to Home page.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              break;
            case 1:
              // Navigate to Bookmark page.
              break;
            case 2:
              // Navigate to Ticket page (PostFormPage).
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostFormPage()),
              );
              break;
            case 3:
              break;
          }
        },
      ),
    );
  }
}
