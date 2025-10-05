import 'dart:io';

void main() {
  // Meminta input skor dari pengguna
  stdout.write("Masukkan skor Anda (0 - 100): ");
  String? input = stdin.readLineSync();

  // Cek apakah input kosong atau bukan angka
  if (input == null || input.isEmpty) {
    print("Error: Input tidak boleh kosong.");
    return;
  }

  int? skor = int.tryParse(input);

  // Validasi input
  if (skor == null || skor < 0 || skor > 100) {
    print("Error: Skor harus berupa angka antara 0 - 100.");
    return;
  }

  String grade;

  // Menentukan grade dengan if-else
  if (skor >= 85) {
    grade = "A";
  } else if (skor >= 70) {
    grade = "B";
  } else if (skor >= 60) {
    grade = "C";
  } else if (skor >= 50) {
    grade = "D";
  } else {
    grade = "E";
  }

  // Menampilkan hasil
  print("Skor Anda: $skor");
  print("Grade Anda: $grade");
}
