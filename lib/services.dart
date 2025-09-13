import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support', style: TextStyle(fontWeight: FontWeight.bold)),
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
              _buildSection(
                icon: Icons.emergency_outlined,
                title: 'Emergency Information',
                child: _buildEmergencyInfo(),
              ),
              const SizedBox(height: 24),
              _buildSection(
                icon: Icons.integration_instructions_outlined,
                title: 'Step-by-Step Guides',
                child: _buildStepByStepGuides(),
              ),
              const SizedBox(height: 24),
              _buildSection(
                icon: Icons.quiz_outlined,
                title: 'Frequently Asked Questions',
                child: _buildFaqs(),
              ),
              const SizedBox(height: 24),
              _buildSection(
                icon: Icons.contact_support_outlined,
                title: 'Contact Support',
                child: _buildContactSupport(),
              ),
              const SizedBox(height: 24),
              _buildSection(
                icon: Icons.report_problem_outlined,
                title: 'Report an Issue',
                child: _buildReportAnIssue(),
              ),
              const SizedBox(height: 24),
              _buildSection(
                icon: Icons.feedback_outlined,
                title: 'Send Us Feedback',
                child: _buildSendFeedback(),
              ),
              const SizedBox(height: 24),
              _buildSection(
                icon: Icons.gavel_outlined,
                title: 'Legal Information',
                child: _buildLegalInformation(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required IconData icon, required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue[800]),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

  Widget _buildEmergencyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Quick access to emergency services and vital information to ensure your safety.'),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.local_police_outlined),
          label: const Text('Call Police'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[400],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.local_hospital_outlined),
          label: const Text('Call Ambulance'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[400],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.flag_outlined),
          label: const Text('Local Embassy'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[400],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildStepByStepGuides() {
    return const Column(
      children: [
        ExpansionTile(
          title: Text('How to activate SOS during an emergency?'),
          children: [Padding(padding: EdgeInsets.all(16.0), child: Text('In a critical situation, quickly tap the red \"SOS\" button in the bottom navigation bar twice. This will send your live location and a pre-set emergency message to your designated contacts. Hold the button for 3 seconds for a direct emergency service call.'))],
        ),
        ExpansionTile(
          title: Text('What to do if lost without network?'),
          children: [Padding(padding: EdgeInsets.all(16.0), child: Text('Content for this section goes here.'))],
        ),
        ExpansionTile(
          title: Text('How to use Geo-Fencing alerts?'),
          children: [Padding(padding: EdgeInsets.all(16.0), child: Text('Content for this section goes here.'))],
        ),
      ],
    );
  }

  Widget _buildFaqs() {
    return const Column(
      children: [
        ExpansionTile(
          title: Text('What is SafePath Connect?'),
          children: [Padding(padding: EdgeInsets.all(16.0), child: Text('SafePath Connect is a mobile application designed to enhance safety for tourists in unfamiliar locations, offering real-time tracking, geo-fencing, offline maps, and emergency assistance.'))],
        ),
        ExpansionTile(
          title: Text('Is my location data private?'),
          children: [Padding(padding: EdgeInsets.all(16.0), child: Text('Content for this section goes here.'))],
        ),
        ExpansionTile(
          title: Text('How do I add emergency contacts?'),
          children: [Padding(padding: EdgeInsets.all(16.0), child: Text('Content for this section goes here.'))],
        ),
      ],
    );
  }

  Widget _buildContactSupport() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.chat_bubble_outline),
          title: const Text('Chat with an Agent'),
          onTap: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.grey[300]!)),
        ),
        const SizedBox(height: 8),
        ListTile(
          leading: const Icon(Icons.email_outlined),
          title: const Text('Email Support'),
          onTap: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.grey[300]!)),
        ),
        const SizedBox(height: 8),
        ListTile(
          leading: const Icon(Icons.call_outlined),
          title: const Text('Call Helpline'),
          onTap: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.grey[300]!)),
        ),
      ],
    );
  }

  Widget _buildReportAnIssue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Encountered a bug or a problem? Let us know so we can fix it.'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit an Issue Report'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[300],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget _buildSendFeedback() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Your thoughts help us improve SafePath Connect for everyone.'),
        const SizedBox(height: 16),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Share your experience or suggestions...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit Feedback'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[300],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget _buildLegalInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Understand your rights and our commitments.'),
        TextButton(onPressed: () {}, child: const Text('Terms of Service')),
        TextButton(onPressed: () {}, child: const Text('Privacy Policy')),
      ],
    );
  }
}
