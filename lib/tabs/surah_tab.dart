import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/surah.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<ListSurah>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/datas/list-surah.json');
    return listSurahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListSurah>>(
      future: _getSurahList(),
      initialData: [],
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return ListView.separated(
          itemBuilder: (context, index) => _surahItem(surah: snapshot.data!.elementAt(index)), separatorBuilder: (context, index) => Container(),
          itemCount: snapshot.data!.length,
        );
      }),
    );
  }

  Container _surahItem({ required ListSurah surah }) => Container(
    child: Text('oke', style: GoogleFonts.poppins(color: Colors.white ),),
  );

}
