import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/global.dart';
import 'package:quran_app/model/ayat.dart'; // Ganti ini ke model yang sesuai

class DetailScreen extends StatelessWidget {
  final int noSurat;

  const DetailScreen({super.key, required this.noSurat});

  Future<Ayat> _getDetailSurah() async {
    final response = await Dio().get("https://equran.id/api/v2/surat/$noSurat");
    return ayatFromJson(
      json.encode(response.data),
    ); // Pakai fungsi ayatFromJson
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ayat>(
      future: _getDetailSurah(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Color(0xff040C23),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        Ayat ayat = snapshot.data!;
        Data data = ayat.data;

        return Scaffold(
          backgroundColor: backgroundcolor,
          appBar: _appBar(context: context, namaLatin: data.namaLatin),
          body: ListView.builder(
            itemCount: data.ayat.length,
            itemBuilder: (context, index) {
              final ayatElement = data.ayat[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ayatElement.teksArab,
                      style: GoogleFonts.amiri(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      ayatElement.teksLatin,
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ayatElement.teksIndonesia,
                      style: TextStyle(color: Colors.white),
                    ),
                    const Divider(),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  AppBar _appBar({required BuildContext context, required String namaLatin}) =>
      AppBar(
        backgroundColor: backgroundcolor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: SvgPicture.asset('assets/svgs/back-icon.svg'),
            ),
            const SizedBox(width: 15),
            Text(
              namaLatin,
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
}
