import 'package:flutter/material.dart';
import '../colors/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final PageController _pageController = PageController();
  final List<String> _imagePaths = [
    'assets/profile_gallery/photo1.jpg',
    'assets/profile_gallery/photo2.jpg',
    'assets/profile_gallery/photo3.jpg',
    'assets/profile_gallery/photo4.jpg',
    'assets/profile_gallery/photo5.jpg',
  ];

  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < _imagePaths.length - 1) {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Profile Picture
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_pic.jpg'),
              ),
            ),

            // Display Name
            const Text(
              'MARCUS OSAKA',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Username
            const Text(
              '@osakamarcus',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            // Latest Posts
            const Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 2.0),
              child: Text(
                'Latest posts',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            // Photo Gallery
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: _previousPage,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    iconSize: 12.0,
                    alignment: Alignment.center,
                    enableFeedback: true,
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _imagePaths.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _imagePaths[index],
                        fit: BoxFit.cover,
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: _nextPage,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    iconSize: 12.0,
                    alignment: Alignment.center,
                    enableFeedback: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
