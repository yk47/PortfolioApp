import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectTab extends StatefulWidget {
  const ProjectTab({super.key});

  @override
  State<ProjectTab> createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {
  final List<Map<String, String>> projects = [
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'image': 'assets/images/img1.jpeg'
    },
    {'title': 'Project 2', 'image': 'assets/images/img2.jpeg'},
    {'title': 'Project 3', 'image': 'assets/images/img3.jpeg'},
    {'title': 'Project 4', 'image': 'assets/images/img4.jpeg'},
    {'title': 'Project 5', 'image': 'assets/images/img5.jpeg'},
  ];

  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredProjects = [];
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    filteredProjects = projects;
    searchController.addListener(() {
      filterProjects();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void filterProjects() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredProjects = projects
          .where((project) => project['title']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: TextField(
                    controller: searchController,
                    focusNode: searchFocusNode,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      labelText: 'Search a project',
                      labelStyle: const TextStyle(
                          color: Colors.black38, fontFamily: 'Roboto'),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredProjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            filteredProjects[index]['image']!,
                            width: 100,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filteredProjects[index]['title']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BAHASA SUNDA',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          'Oleh Al-Baiqi Samaan',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 55),
                                    Container(
                                      width: 45,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color.fromRGBO(243, 149, 25, 1),
                                              Color.fromRGBO(255, 205, 103, 1),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'A',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
