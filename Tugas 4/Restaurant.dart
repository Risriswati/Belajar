import 'dart:io';

void main() {
  // Menu makanan dan minuman mewah
  List<String> makanan = ["Wagyu Steak", "Lobster Thermidor", "Truffle Pasta"];
  List<int> hargaMakanan = [850000, 620000, 490000];

  List<String> minuman = ["Red Wine", "Champagne", "Matcha Latte"];
  List<int> hargaMinuman = [350000, 480000, 90000];

  int total = 0;
  String lanjut = "y";

  print("=== RESTORAN ===");

  // Simulasi do-while
  do {
    print("\nMenu Makanan:");
    for (int i = 0; i < makanan.length; i++) {
      print("${i + 1}. ${makanan[i]} - Rp${hargaMakanan[i]}");
    }

    stdout.write("Pilih nomor makanan: ");
    int? pilihMakanan = int.tryParse(stdin.readLineSync() ?? "");
    if (pilihMakanan != null &&
        pilihMakanan > 0 &&
        pilihMakanan <= makanan.length) {
      total += hargaMakanan[pilihMakanan - 1];
    } else {
      print("Pilihan tidak valid!");
    }

    print("\nMenu Minuman:");
    for (int i = 0; i < minuman.length; i++) {
      print("${i + 1}. ${minuman[i]} - Rp${hargaMinuman[i]}");
    }

    stdout.write("Pilih nomor minuman: ");
    int? pilihMinuman = int.tryParse(stdin.readLineSync() ?? "");
    if (pilihMinuman != null &&
        pilihMinuman > 0 &&
        pilihMinuman <= minuman.length) {
      total += hargaMinuman[pilihMinuman - 1];
    } else {
      print("Pilihan tidak valid!");
    }

    print("\nTotal sementara: Rp$total");

    stdout.write("Mau pesan lagi? (y/n): ");
    lanjut = stdin.readLineSync() ?? "n";
  } while (lanjut.toLowerCase() == "y");

  print("\n=== STRUK PEMBAYARAN ===");
  print("Total yang harus dibayar: Rp$total");
  print("Terima kasih telah memesan di sini!");
}
