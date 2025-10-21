import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:manga_app/firebase/firebase_auth_service.dart';
//import 'package:manga_app/providers/providers.dart';

class ProfilePage extends StatelessWidget {
  final String userId;
  ProfilePage({super.key, required this.userId})
    : assert(userId.isNotEmpty, 'L\'ID utente non può essere vuoto');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(
        53,
        49,
        49,
        0.85,
      ), // Dark gray background
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
        title: Text('Profilo n° $userId'),
      ),
      body: Stack(
        children: [
          // Header section with profile info
          Stack(
            children: [
              // Profile title and nickname in header
              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.of(context).size.height * 0.2,
                child: const Center(
                  child: Text(
                    'NICKNAME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content card
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 245, 245, 0.75),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    // Badges Section
                    const Text(
                      'Badges',
                      style: TextStyle(
                        color: Color.fromRGBO(144, 93, 93, 1), // Reddish-brown
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Badge items
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBadge('Badge 1'),
                        _buildBadge('Badge 2'),
                        _buildBadge('Badge 3'),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // La mia lista section
                    _buildNavigationItem(
                      'La mia lista',
                      Icons.arrow_forward,
                      () {
                        // Navigate to user's list
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('La mia lista')),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // Impostazioni section
                    _buildNavigationItem(
                      'Impostazioni',
                      Icons.arrow_forward,
                      () {
                        // Navigate to settings
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Impostazioni')),
                        );
                      },
                    ),

                    // Add bottom padding to prevent content from being cut off
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              const Center(
                child: Icon(Icons.emoji_events, size: 40, color: Colors.grey),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bookmark,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationItem(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(144, 93, 93, 1), // Reddish-brown
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(icon, color: Colors.grey[600], size: 16),
          ],
        ),
      ),
    );
  }
}
