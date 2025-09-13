
import 'package:flutter/material.dart';

class EmergencySOSPage extends StatefulWidget {
  const EmergencySOSPage({super.key});

  @override
  State<EmergencySOSPage> createState() => _EmergencySOSPageState();
}

class _EmergencySOSPageState extends State<EmergencySOSPage> {
  bool _isGeoFencingEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency SOS', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSOSButton(),
              const SizedBox(height: 16),
              const Text(
                'Your safety is our priority. Use this button responsibly in genuine emergencies.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              _buildDirectCallCard(),
              const SizedBox(height: 24),
              _buildGeoFencingCard(),
              const SizedBox(height: 24),
              _buildActiveAlertsLog(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSOSButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Column(
        children: [
          Text('SOS', style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Single press for silent alert', style: TextStyle(color: Colors.white)),
          Text('Double press for audible alarm & location sharing', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildDirectCallCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Direct Emergency Call', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.call),
              label: const Text('Call Emergency Helpline'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeoFencingCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Geo-Fencing & Alerts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text('Enable Geo-Fencing Alerts'),
              value: _isGeoFencingEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isGeoFencingEnabled = value;
                });
              },
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('View Geo-fencing Areas'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 48),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveAlertsLog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Active Alerts Log', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildAlertItem(
          icon: Icons.warning_amber_rounded,
          iconColor: Colors.orange,
          title: 'Hazardous Zone Detected',
          subtitle: 'You are approaching a high-risk area. Exercise extreme caution.',
          time: '5 min ago',
        ),
        _buildAlertItem(
          icon: Icons.check_circle_outline,
          iconColor: Colors.green,
          title: 'Safe Zone Reached',
          subtitle: 'You have entered a designated safe zone. Enjoy your stay.',
          time: '2 hours ago',
        ),
        _buildAlertItem(
          icon: Icons.campaign,
          iconColor: Colors.blue,
          title: 'Emergency Alert Broadcast',
          subtitle: 'Local authorities issued a warning for severe weather.',
          time: 'Yesterday, 10:30 AM',
        ),
      ],
    );
  }

  Widget _buildAlertItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
