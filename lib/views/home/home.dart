import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:s_rocks_music/utils/constants.dart';
import 'package:s_rocks_music/viewmodels/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          HeroSection(),
          SizedBox(height: 20),
          Text(
            'Hire hand-picked Pros for popular music services',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: kprimaryTextColor),
          ),
          SizedBox(height: 20),
          ServiceCardWidget(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ksecondaryColor, ksecondaryDarkColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          // Search Bar
          Positioned(
            top: 50,
            width: screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  decoration: BoxDecoration(
                    color: kprimaryBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    width: screenWidth * 0.7,
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Search “Punjabi Lyrics”',
                              hintStyle: TextStyle(color: Colors.white30),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.mic, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black),
                ),
              ],
            ),
          ),

          // Center Text and Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Claim your',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16
                    ),
                  ),
                  Text(
                    'Free Demo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                    ),
                  ),
                  Text(
                    'for custom Music Production',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Book Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),

          // Vinyl Disk (Left)
          Positioned(
            left: -30,
            bottom: 10,
            child: Image.asset('assets/heroSection/cd.png', width: 120),
          ),

          // Keyboard (Right)
          Positioned(
            right: -30,
            bottom: 10,
            child: Image.asset('assets/heroSection/piano.png', width: 120),
          ),
        ],
      ),
    );
  }
}

class ServiceCardWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    if (homeViewModel.loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (homeViewModel.services.isEmpty) {
      return Center(child: Text("No services available."));
    }
    
    return Column(
      spacing: 10,
      children: homeViewModel.services.map((service) {
        return ServiceCard(
          title: service.title,
          subtitle: service.description,
          icon: SvgPicture.asset(
            'assets/icons/service/${service.icon}.svg',
            width: 50,
            height: 50,
          ),
          routeName: service.routeName,
        );
      }).toList(),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final String routeName;

  const ServiceCard({
    super.key, 
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped on $title');
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0),
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: Image.asset('assets/service-bg.png').image,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                kprimaryColor.withOpacity(0.9),
                BlendMode.srcOver,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: 12),
              icon,
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
