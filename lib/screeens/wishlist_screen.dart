import 'package:flutter/material.dart';
class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Wishlist",
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Wishlist Item 1
          _wishlistCard(
            imageUrl: "assets/images/img1.jpg",
            title: "CRAFTSMAN HOUSE",
            location: "520 N Btoudiry Ave Los Angeles",
            beds: 4,
            baths: 4,
            garages: 1,
          ),
          const SizedBox(height: 16),

          // Wishlist Item 2
          _wishlistCard(
            imageUrl: "assets/images/img2.jpg",
            title: "CRAFTSMAN HOUSE 1",
            location: "520 N Btoudiry Ave Los Angeles",
            beds: 4,
            baths: 4,
            garages: 1,
          ),
        ],
      ),
    );
  }

  Widget _wishlistCard({
    required String imageUrl,
    required String title,
    required String location,
    required int beds,
    required int baths,
    required int garages,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),

          // Title and Bookmark
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.bookmark, color: Colors.white),
            ],
          ),
          const SizedBox(height: 8),

          // Location
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                location,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Details (Beds, Baths, Garage)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _detailIcon(Icons.bed, "$beds Beds"),
              _detailIcon(Icons.bathtub, "$baths Baths"),
              _detailIcon(Icons.garage, "$garages Garage"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.amber),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
