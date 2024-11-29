import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/screeens/wishlist_screen.dart';

import 'detail_screen.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  _PropertyScreenState createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  List<PropertyCardData> wishlist = [];

  void addToWishlist(PropertyCardData property) {
    setState(() {
      wishlist.add(property);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with bookmark icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Los Angeles, CA",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark_outline,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WishlistScreen()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Title
                const Text(
                  "Discover Best\nSuitable Property",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Filter Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FilterButton(label: "House", isSelected: true),
                    const SizedBox(width: 8),
                    FilterButton(label: "Apartment"),
                    const SizedBox(width: 8),
                    FilterButton(label: "Flot"),
                  ],
                ),
                const SizedBox(height: 24),

                // Best Properties Section
                const Text(
                  "Best for you",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Horizontal Property Cards
                SizedBox(
                  height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(

                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: EdgeInsets.only(
                          right: index == 2 ? 0 : 16,
                        ),
                        child: PropertyCard(
                          title: index == 0
                              ? "CRAFTSMAN HOUSE"
                              : index == 1
                              ? "MODERN VILLA"
                              : "FAMILY HOUSE",
                          location: index == 0
                              ? "520 N Btoudry Ave Los Angeles"
                              : index == 1
                              ? "1234 Beverly Hills, CA"
                              : "789 Hollywood Blvd, CA",
                          beds: index == 0 ? 4 : index == 1 ? 5 : 3,
                          baths: index == 0 ? 4 : index == 1 ? 5 : 2,
                          garages: index == 0 ? 1 : index == 1 ? 2 : 1,
                          imageUrl: index == 0
                              ? "assets/images/img1.jpg"
                              : index == 1
                              ? "assets/images/img3.jpg"
                              : "assets/images/img2.jpg",
                          onAddToWishlist: addToWishlist,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Nearby Properties Section
                const Text(
                  "Nearby your location",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                NearbyPropertyCard(
                  title: "RANCH HOME",
                  location: "520 N Btoudry Ave Los Angeles",
                  beds: 4,
                  baths: 4,
                  garages: 1,
                  imageUrl: "assets/images/img2.jpg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Filter Button Widget
class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterButton({
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

// Property Card Widget
class PropertyCard extends StatelessWidget {
  final String title;
  final String location;
  final int beds;
  final int baths;
  final int garages;
  final String imageUrl;
  final Function(PropertyCardData) onAddToWishlist;

  const PropertyCard({
    required this.title,
    required this.location,
    required this.beds,
    required this.baths,
    required this.garages,
    required this.imageUrl,
    required this.onAddToWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PropertyCardData property = PropertyCardData(
          title: title,
          location: location,
          beds: beds,
          baths: baths,
          garages: garages,
          imageUrl: imageUrl,
        );
        // Navigate to detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailScreen(property: property),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.bed, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text("$beds Beds"),
                      const SizedBox(width: 16),
                      const Icon(Icons.bathtub, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text("$baths Baths"),
                      const SizedBox(width: 16),
                      const Icon(Icons.garage, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text("$garages Garage"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Nearby Property Card Widget
class NearbyPropertyCard extends StatelessWidget {
  final String title;
  final String location;
  final int beds;
  final int baths;
  final int garages;
  final String imageUrl;

  const NearbyPropertyCard({
    required this.title,
    required this.location,
    required this.beds,
    required this.baths,
    required this.garages,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              width: 110,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.bed, size: 16, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text("$beds Beds"),
                      const SizedBox(width: 6),
                      const Icon(Icons.bathtub, size: 16, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text("$baths Baths"),
                      const SizedBox(width: 6),
                      const Icon(Icons.garage, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text("$garages Garage"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Property Detail Screen
// class PropertyDetailScreen extends StatelessWidget {
//   final PropertyCardData property;
//
//   const PropertyDetailScreen({required this.property});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//         title: const Text(
//           "Detail",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Property Image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Image.network(
//                   property.imageUrl,
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(height: 16),
//
//               // Property Title and Location
//               Text(
//                 property.title,
//                 style: const TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   const Icon(Icons.location_on, color: Colors.grey),
//                   const SizedBox(width: 4),
//                   Text(
//                     property.location,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//
//               // Property Details (Beds, Baths, Garage)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _propertyDetailIcon(Icons.bed, "${property.beds} Beds"),
//                   _propertyDetailIcon(Icons.bathtub, "${property.baths} Baths"),
//                   _propertyDetailIcon(Icons.garage, "${property.garages} Garage"),
//                 ],
//               ),
//               const SizedBox(height: 16),
//
//               // Owner Section
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 24,
//                     backgroundImage: const AssetImage("assets/images/owner.jpg"),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "Rebecca Tetha",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "Owner Craftsman House",
//                           style: TextStyle(fontSize: 14, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // Call button action
//                     },
//                     icon: const Icon(Icons.call),
//                     label: const Text("Call"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//
//               // Property Description
//               const Text(
//                 "Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garage. Amazing curb appeal and entertain area with breathtaking views. Tons of built-ins & extras.",
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               const SizedBox(height: 16),
//
//               // Gallery Section
//               const Text(
//                 "Gallery",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               SizedBox(
//                 height: 80,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     _galleryImage("assets/images/img4.jpg"),
//                     _galleryImage("assets/images/img5.jpg"),
//                     _galleryImage("assets/images/img6.jpg"),
//                     _galleryImage("assets/images/img7.jpg"),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//
//               // Price and Buy Now Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "\$5,999,000",
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Buy Now action
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       "BUY NOW",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _propertyDetailIcon(IconData icon, String label) {
//     return Column(
//       children: [
//         Icon(icon, size: 28, color: Colors.amber),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: const TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//       ],
//     );
//   }
//
//   Widget _galleryImage(String imagePath) {
//     return Container(
//       margin: const EdgeInsets.only(right: 8),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: Image.asset(
//           imagePath,
//           width: 80,
//           height: 80,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }


// Property Data Model
class PropertyCardData {
  final String title;
  final String location;
  final int beds;
  final int baths;
  final int garages;
  final String imageUrl;

  PropertyCardData({
    required this.title,
    required this.location,
    required this.beds,
    required this.baths,
    required this.garages,
    required this.imageUrl,
  });
}
