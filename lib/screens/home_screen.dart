import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/global.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prophet Muhammad SAW',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Asslamualaikum',
              style: GoogleFonts.poppins(
                color: text,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            _lastRead(),
          ],
        ),
      ),
    );
  }

  Stack _lastRead() {
    return Stack(
            children: [
              Container(
                height: 131,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffDF98FA), Color(0xff9055FF)],
                    stops: [0.0, 0.8],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('assets/svgs/quran.svg'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/book-icon.svg'),
                        const SizedBox(width: 8),
                        Text(
                          'Last Read',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Al Fatiha',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ayat No: 1',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  AppBar _appBar() => AppBar(
    backgroundColor: backgroundcolor,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/svgs/menu-icon.svg'),
        ),
        const SizedBox(width: 24),
        Text(
          'Quran App',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/svgs/search-icon.svg'),
        ),
      ],
    ),
  );
  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    backgroundColor: bottomBar,
    items: [
      _bottomBarItem(icon: 'assets/svgs/quran-icon.svg', label: 'Quran'),
      _bottomBarItem(icon: 'assets/svgs/lampu-icon.svg', label: 'Tips'),
      _bottomBarItem(
        icon: 'assets/svgs/orang-shalat-icon.svg',
        label: 'Orang-shalat',
      ),
      _bottomBarItem(icon: 'assets/svgs/tangan-icon.svg', label: 'tangan'),
      _bottomBarItem(icon: 'assets/svgs/bookmark-icon.svg', label: 'bookmark'),
    ],
  );

  BottomNavigationBarItem _bottomBarItem({
    required String icon,
    required String label,
  }) => BottomNavigationBarItem(
    icon: SvgPicture.asset(icon),
    activeIcon: SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
    ),
    label: label,
  );
}
