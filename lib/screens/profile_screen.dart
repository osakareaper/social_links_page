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
                color: AppColors.darkRed,
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

            // Photo Gallery
            Expanded(
                child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _imagePaths.length,
                  itemBuilder: (context, index) {
                    return Image.asset(_imagePaths[index]);
                  },
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
                Positioned(
                  left: 10,
                  top: MediaQuery.of(context).size.height / 2 - 25,
                  child: IconButton(
                    onPressed: _previousPage,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: MediaQuery.of(context).size.height / 2 - 25,
                  child: IconButton(
                    onPressed: _nextPage,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
