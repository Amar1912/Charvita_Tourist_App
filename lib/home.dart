import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 4) { // SOS button
      Navigator.pushNamed(context, 'emergency');
    } else if (index == 2) { // Search button
      Navigator.pushNamed(context, 'search');
    } else if (index == 3) { // Services button
      Navigator.pushNamed(context, 'services');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                icon: const CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'profile');
                },
              ),
            ],
            backgroundColor: Colors.white,
            expandedHeight: 50.0,
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildInfoCard(
                  icon: Icons.location_on,
                  title: 'Current Location',
                  subtitle: 'Latitude: 34.0522° N\nLongitude: 118.2437° W',
                  buttonText: 'View Map',
                  image: 'https://i.imgur.com/4lS1aUN.png',
                ),
                _buildInfoCard(
                  icon: Icons.fence,
                  title: 'Geo-Fencing Status',
                  subtitle: '3 active boundaries set.',
                  status: 'Active',
                  image: 'https://i.imgur.com/4lS1aUN.png',
                ),
                _buildInfoCard(
                  icon: Icons.map,
                  title: 'Offline Maps Available',
                  subtitle: 'Download maps to navigate safely even without internet access. Your safety, always.',
                ),
                _buildInfoCard(
                  icon: Icons.security,
                  title: 'Local Safety Insights',
                  subtitle: 'Access community-sourced safety scores and local tips to make informed decisions.',
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Nearby Safe Places',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildNearbySafePlace(
                  icon: Icons.local_hospital,
                  name: 'City Hospital',
                  type: 'Medical',
                  safety: '92% Safe',
                  distance: '1.2 km',
                ),
                _buildNearbySafePlace(
                  icon: Icons.local_police,
                  name: 'Police Station',
                  type: 'Emergency',
                  safety: '88% Safe',
                  distance: '0.8 km',
                ),
                _buildNearbySafePlace(
                  icon: Icons.store,
                  name: 'Safe Haven Cafe',
                  type: 'Shelter',
                  safety: '75% Safe',
                  distance: '0.5 km',
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Quick Shortcuts',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildQuickShortcut(
                  icon: Icons.receipt_long,
                  text: 'Recent Incident Log',
                  onTap: () {},
                ),
                _buildQuickShortcut(
                  icon: Icons.person,
                  text: 'My Profile',
                  onTap: () => Navigator.pushNamed(context, 'about'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'SOS',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    String? buttonText,
    String? status,
    String? image,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 40),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(subtitle),
                    ],
                  ),
                ),
                if (buttonText != null)
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(buttonText),
                  ),
                if (status != null)
                  Text(
                    status,
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
              ],
            ),
            if (image != null) ...[
              const SizedBox(height: 16),
              Image.network(image),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNearbySafePlace({
    required IconData icon,
    required String name,
    required String type,
    required String safety,
    required String distance,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.green),
        title: Text(name),
        subtitle: Text('$type • $safety'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(distance),
            const SizedBox(width: 8),
            const Icon(Icons.directions),
            const SizedBox(width: 8),
            const Icon(Icons.phone),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickShortcut({required IconData icon, required String text, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
