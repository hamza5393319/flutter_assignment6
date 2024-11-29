import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/screeens/property_screen.dart';
import 'wishlist_screen.dart'; // Import WishlistScreen

class PropertyDetailScreen extends StatelessWidget {
  final PropertyCardData property;

  const PropertyDetailScreen({required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Detail",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  property.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Property Title, Wishlist Icon, and Location
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      property.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WishlistScreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.bookmark_outline,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    property.location,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Property Details (Beds, Baths, Garage)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _propertyDetailIcon(Icons.bed, "${property.beds} Beds"),
                  _propertyDetailIcon(Icons.bathtub, "${property.baths} Baths"),
                  _propertyDetailIcon(Icons.garage, "${property.garages} Garage"),
                ],
              ),
              const SizedBox(height: 16),

              // Owner Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: const AssetImage("assets/images/img1.jpg"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Rebecca Tetha",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Owner Craftsman House",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Call button action
                    },
                    icon: const Icon(Icons.call),
                    label: const Text("Call"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Property Description
              const Text(
                "Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garage. Amazing curb appeal and entertain area with breathtaking views. Tons of built-ins & extras.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Gallery Section
              const Text(
                "Gallery",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _galleryImage("assets/images/img4.jpg"),
                    _galleryImage("assets/images/img5.jpg"),
                    _galleryImage("assets/images/img6.jpg"),
                    _galleryImage("assets/images/img7.jpg"),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Price and Buy Now Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$5,999,000",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Buy Now action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "BUY NOW",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _propertyDetailIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.amber),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _galleryImage(String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
