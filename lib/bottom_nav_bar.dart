import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_portfolio/portfolio_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Center(),
    const PortfolioPageContent(),
    const Center(),
    const Center(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromRGBO(223, 85, 50, 1),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            _buildNavBarItem(
                'assets/icons/Home.svg', 'assets/icons/HomeOn.svg', 'Home', 0),
            _buildNavBarItem('assets/icons/Portfolia.svg',
                'assets/icons/PortfoliaOn.svg', 'Portfolio', 1),
            _buildNavBarItem('assets/icons/Input.svg',
                'assets/icons/InputOn.svg', 'Input', 2),
            _buildNavBarItem('assets/icons/Profile.svg',
                'assets/icons/ProfileOn.svg', 'Profile', 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
      String iconPath, String selectedIconPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Container(
            width: 25,
            height: _selectedIndex == index ? 3 : 0,
            color: const Color.fromRGBO(223, 85, 50, 1),
          ),
          const SizedBox(
            height: 5,
          ),
          SvgPicture.asset(
            _selectedIndex == index ? selectedIconPath : iconPath,
            width: 24,
            height: 24,
          ),
        ],
      ),
      label: label,
    );
  }
}
