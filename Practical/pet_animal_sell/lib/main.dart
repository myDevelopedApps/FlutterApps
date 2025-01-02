// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MainApp());
// // }

// // class MainApp extends StatelessWidget {
// //   const MainApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       home: Scaffold(
// //         body: Center(
// //           child: Text('Hello World!'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// void main() => runApp(AnimalMarketApp());

// class AnimalMarketApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Animal Market',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Animal Market'),
//         backgroundColor: Colors.green,
//       ),
//       body: Column(
//         children: [
//           // Hero Banner
//           Container(
//             height: 200,
//             color: Colors.green[100],
//             child: Center(
//                 child: Image.asset(
//               "assets/dog.jpg",
//               fit: BoxFit.cover,
//             )
//                 //  Text(
//                 //   'Find Your Perfect Animal Companion!',
//                 //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 // ),
//                 ),
//           ),
//           // Categories
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Categories',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 _buildCategoryCard('Cat'),
//                 _buildCategoryCard('Dog'),
//                 _buildCategoryCard('Cow'),
//                 _buildCategoryCard('Buffalo'),
//                 _buildCategoryCard('Goat'),
//               ],
//             ),
//           ),
//           // Featured Listings
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Featured Listings',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 _buildAnimalCard('Cute Cat', 'Cat', '3000 INR', 'Pune'),
//                 _buildAnimalCard('Cute Cat', 'Cat', '3000 INR', 'Pune'),
//                 _buildAnimalCard('Cute Cat', 'Cat', '3000 INR', 'Pune'),
//                 _buildAnimalCard('Friendly Dog', 'Dog', '5000 INR', 'Mumbai'),
//                 _buildAnimalCard('Healthy Cow', 'Cow', '20000 INR', 'Nashik'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryCard(String category) {
//     return GestureDetector(
//       onTap: (){

//       },
//       child: Card(
//         margin: EdgeInsets.symmetric(horizontal: 8),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(category),
//         ),
//       ),
//     );
//   }

//   Widget _buildAnimalCard(
//       String title, String category, String price, String location) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: ListTile(
//         leading: Icon(Icons.pets),
//         title: Text(title),
//         subtitle: Text('$category • $price • $location'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(AnimalMarketApp());

class AnimalMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Market',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of all animal data
  final Map<String, List<Map<String, String>>> animalData = {
    'Cat': [
      {
        'title': 'Cute Cat',
        'category': 'Cat',
        'price': '3000 INR',
        'location': 'Pune'
      },
      {
        'title': 'Playful Cat',
        'category': 'Cat',
        'price': '4000 INR',
        'location': 'Mumbai'
      },
    ],
    'Dog': [
      {
        'title': 'Friendly Dog',
        'category': 'Dog',
        'price': '5000 INR',
        'location': 'Mumbai'
      },
      {
        'title': 'Loyal Dog',
        'category': 'Dog',
        'price': '6000 INR',
        'location': 'Delhi'
      },
    ],
    'Cow': [
      {
        'title': 'Healthy Cow',
        'category': 'Cow',
        'price': '20000 INR',
        'location': 'Nashik'
      },
      {
        'title': 'Milk-Producing Cow',
        'category': 'Cow',
        'price': '25000 INR',
        'location': 'Kolhapur'
      },
    ],
    'Buffalo': [
      {
        'title': 'Strong Buffalo',
        'category': 'Buffalo',
        'price': '30000 INR',
        'location': 'Nagpur'
      },
    ],
    'Goat': [
      {
        'title': 'Agile Goat',
        'category': 'Goat',
        'price': '5000 INR',
        'location': 'Pune'
      },
    ],
  };

  // Selected category
  String selectedCategory = 'Cat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Market'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // Hero Banner
          Container(
            height: 200,
            color: Colors.green[100],
            child: Center(
              child: Image.asset(
                "assets/dog.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Categories
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: animalData.keys.map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(category),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Featured Listings
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Featured Listings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView(
              children: animalData[selectedCategory]!.map((animal) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.pets),
                      Column(
                        children: [
                          Text(animal['title']!),
                          Text(
                              '${animal['category']} • ${animal['price']} • ${animal['location']}'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.call, color: Colors.green),
                            onPressed: () {
                              // Add call functionality here
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.message, color: Colors.blue),
                            onPressed: () {
                              // Add message functionality here
                            },
                          ),
                        ],
                      ),
                    ],
                    // leading: Icon(Icons.pets),
                    // title: Text(animal['title']!),
                    // subtitle: Text(
                    //     '${animal['category']} • ${animal['price']} • ${animal['location']}'),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
