import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_portfolio/project_tab.dart';

class PortfolioPageContent extends StatelessWidget {
  const PortfolioPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Portfolio',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/shopping-bag.svg',
                width: 24,
                height: 24,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 24,
                height: 24,
              ),
            ),
          ],
          bottom: TabBar(
            labelColor: const Color.fromRGBO(223, 85, 50, 1),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color.fromRGBO(223, 85, 50, 1),
            indicatorWeight: 2,
            labelPadding: const EdgeInsets.only(left: 2),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(
              fontSize: 13,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(
                child: Transform.translate(
                  offset: const Offset(-10, 0), // Move text closer to the left
                  child: const Text('Project'),
                ),
              ),
              Tab(
                child: Transform.translate(
                  offset: const Offset(-5, 0), // Adjust spacing as needed
                  child: const Text('Saved'),
                ),
              ),
              Tab(
                child: Transform.translate(
                  offset: const Offset(-10, 0), // Adjust spacing as needed
                  child: const Text('Shared'),
                ),
              ),
              Tab(
                child: Transform.translate(
                  offset: const Offset(-5, 0), // Move text closer to the right
                  child: const Text('Achievement'),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                const ProjectTab(),
                Container(),
                Container(),
                Container(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  height: 40,
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    backgroundColor: const Color.fromRGBO(223, 85, 50, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: const Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Filter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
