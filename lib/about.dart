import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About SafePath Connect', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildApplicationDetails(),
              const SizedBox(height: 24),
              _buildContributorsSection(),
              const SizedBox(height: 24),
              _buildLegalInformationSection(),
              const SizedBox(height: 24),
              _buildLegalNotices(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApplicationDetails() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Application Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('App Name: SafePath Connect'),
            SizedBox(height: 8),
            Text('Version: 1.2.0 (Build 20240726)'),
            SizedBox(height: 8),
            Text('Developed by: Global Safety Solutions'),
            SizedBox(height: 16),
            Text('Empowering safe journeys for tourists worldwide through innovative technology.'),
          ],
        ),
      ),
    );
  }

  Widget _buildContributorsSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Our Contributors', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ExpansionTile(
              title: Text('Core Team'),
              children: [ListTile(title: Text('Team members will be listed here.'))],
            ),
            ExpansionTile(
              title: Text('Community Contributors'),
              children: [ListTile(title: Text('Community contributors will be listed here.'))],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegalInformationSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Legal Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ExpansionTile(
              title: Text('Privacy Policy'),
              children: [ListTile(title: Text('Details about the privacy policy.'))],
            ),
            ExpansionTile(
              title: Text('Terms of Service'),
              children: [ListTile(title: Text('Details about the terms of service.'))],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegalNotices() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Legal Notices', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('© 2025 Global Safety Solutions. All rights reserved. SafePath Connect and its logo are registered trademarks.'),
          ],
        ),
      ),
    );
  }
}
