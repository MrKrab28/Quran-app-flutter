// To parse this JSON data, do
//
//     final ayat = ayatFromJson(jsonString);

import 'dart:convert';

Ayat ayatFromJson(String str) => Ayat.fromJson(json.decode(str));

String ayatToJson(Ayat data) => json.encode(data.toJson());

class Ayat {
    int code;
    String message;
    Data data;

    Ayat({
        required this.code,
        required this.message,
        required this.data,
    });

    factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int nomor;
    String nama;
    String namaLatin;
    int jumlahAyat;
    String tempatTurun;
    String arti;
    String deskripsi;
    Map<String, String> audioFull;
    List<AyatElement> ayat;
    SuratSelanjutnya suratSelanjutnya;
    dynamic suratSebelumnya;

    Data({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audioFull,
        required this.ayat,
        required this.suratSelanjutnya,
        required this.suratSebelumnya,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]).map((k, v) => MapEntry<String, String>(k, v)),
        ayat: List<AyatElement>.from(json["ayat"].map((x) => AyatElement.fromJson(x))),
        suratSelanjutnya: SuratSelanjutnya.fromJson(json["suratSelanjutnya"]),
        suratSebelumnya: json["suratSebelumnya"],
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ayat": List<dynamic>.from(ayat.map((x) => x.toJson())),
        "suratSelanjutnya": suratSelanjutnya.toJson(),
        "suratSebelumnya": suratSebelumnya,
    };
}

class AyatElement {
    int nomorAyat;
    String teksArab;
    String teksLatin;
    String teksIndonesia;
    Map<String, String> audio;

    AyatElement({
        required this.nomorAyat,
        required this.teksArab,
        required this.teksLatin,
        required this.teksIndonesia,
        required this.audio,
    });

    factory AyatElement.fromJson(Map<String, dynamic> json) => AyatElement(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        teksIndonesia: json["teksIndonesia"],
        audio: Map.from(json["audio"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audio": Map.from(audio).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class SuratSelanjutnya {
    int nomor;
    String nama;
    String namaLatin;
    int jumlahAyat;

    SuratSelanjutnya({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
    });

    factory SuratSelanjutnya.fromJson(Map<String, dynamic> json) => SuratSelanjutnya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
    };
}
