import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _recentSearches = [
    'Luxury Hotel Istanbul',
    'Best Italian Restaurant Tokyo',
    'Emergency Hospital London',
    'Local Market Paris',
    'Art Gallery New York',
  ];

  final List<String> _savedSearches = [
    'Safe Hotels Bali',
    'Family Restaurants Rome',
    'Urgent Care Facilities Berlin',
  ];

  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchField(),
              const SizedBox(height: 24),
              _buildFilterByType(),
              const SizedBox(height: 24),
              _buildNearbySection('Nearby Hotels', _buildHotelList()),
              const SizedBox(height: 24),
              _buildNearbySection('Nearby Restaurants', _buildRestaurantList()),
              const SizedBox(height: 24),
              _buildNearbySection('Nearby Hospitals', _buildHospitalList()),
              const SizedBox(height: 24),
              _buildSearchHistory('Recent Searches', _recentSearches),
              const SizedBox(height: 24),
              _buildSearchHistory('Saved Searches', _savedSearches),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for places, hotels, hospitals',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.mic),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildFilterByType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Filter by Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFilterChip('All'),
            _buildFilterChip('Hotels'),
            _buildFilterChip('Restaurants'),
            _buildFilterChip('Hospitals'),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedFilter = label;
          });
        }
      },
      backgroundColor: Colors.grey[200],
      selectedColor: Colors.blue[100],
      labelStyle: TextStyle(color: isSelected ? Colors.blue[800] : Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildNearbySection(String title, Widget list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: list,
        ),
      ],
    );
  }

  Widget _buildHotelList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildPlaceCard(
          'https://i.imgur.com/RE4BYsE.jpg', 
          'Grand View Hotel',
          '8.9 Safe',
          '1.2 km away',
          '4.7',
        ),
        _buildPlaceCard(
          'https://i.imgur.com/D4V2Y0y.jpg',
          'Riverfront Suites',
          '9.1 Safe',
          '0.8 km away',
          '4.9',
        ),
      ],
    );
  }

  Widget _buildRestaurantList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildPlaceCard(
          'https://i.imgur.com/pG5A413.jpg',
          'The Golden Spoon Bistro',
          '9.1 Safe',
          '0.5 km away',
          '4.8',
        ),
        _buildPlaceCard(
          'https://i.imgur.com/2uA62bN.jpg',
          'Spice Route',
          '8.5 Safe',
          '1.5 km away',
          '4.5',
        ),
      ],
    );
  }

  Widget _buildHospitalList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildPlaceCard(
          'https://i.imgur.com/pG5A413.jpg',
          'Central City Hospital',
          '9.5 Safe',
          '3.0 km away',
          '4.9',
        ),
        _buildPlaceCard(
          'https://i.imgur.com/2uA62bN.jpg',
          'Community Clinic',
          '9.2 Safe',
          '1.0 km away',
          '4.8',
        ),
      ],
    );
  }

  Widget _buildPlaceCard(String imageUrl, String name, String safety, String distance, String rating) {
    return SizedBox(
      width: 200,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('$distance • $safety', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  Row(
                    children: [ 
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(rating, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.navigation, size: 16),
                          label: const Text('Navigate'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[100],
                            foregroundColor: Colors.blue[800],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.call, size: 16),
                        label: const Text('Call'),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
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

  Widget _buildSearchHistory(String title, List<String> searches) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: searches.length,
          itemBuilder: (context, index) {
            final search = searches[index];
            return ListTile(
              leading: const Icon(Icons.search, color: Colors.grey),
              title: Text(search),
              trailing: IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    searches.removeAt(index);
                  });
                },
              ),
              contentPadding: EdgeInsets.zero,
            );
          },
        ),
      ],
    );
  }
}
