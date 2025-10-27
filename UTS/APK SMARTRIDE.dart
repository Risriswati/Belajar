import 'dart:io';
import 'dart:mirrors';

abstract class Transportasi{
  String id; 
  String nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar;

  double hitungTarif(int jumlahPenumpang);
  void tampilInfo();
}

class Taksi extends Transportasi{
  String kotaAsal;
  String kotaTujuan;

  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.kotaAsal, this.kotaTujuan) : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang){
    double jarak = hitungJarakDarat(kotaAsal, kotaTujuan);
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo(){
  print("Taksi:$nama($kotaAsal ke $kotaTujuan)");
  }
}

  class Bus extends Transportasi{
    bool adaWifi;
    String kotaTujuan;

    Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi, this.kotaTujuan) : super (id, nama, tarifDasar, kapasitas);

    @override
    double hitungTarif(int jumlahPenumpang){
      return(tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
    }

    @override
    void tampilInfo(){
      print("Bus:$nama (Tujuan ke $kotaTujuan, Wifi: ${adaWifi ? "ada" : "tidak ada"})");
    }
  }

  class Pesawat extends Transportasi{
  String kelas;
  String kotaAsal;
  String kotaTujuan;
  

  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas, this.kotaAsal, this.kotaTujuan) : super(id, nama, tarifDasar, kapasitas);
  

  @override
  double hitungTarif(int jumlahPenumpang){
    double jarak = hitungJarakUdara(kotaAsal, kotaTujuan);
    return tarifDasar * jumlahPenumpang * (kelas=="bisnis"?1.5:1.0)*(jarak/100);
  }

  @override
  void tampilInfo(){
    print("Pesawat:$nama ($kotaAsal ke $kotaTujuan, kelas: $kelas)");
  }
  }

  class Pemesanan{
    String idPemesanan;
    String namaPelanggan;
    Transportasi transportasi;
    int jumlahPenumpang;
    double totalTarif;

    Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi, this.jumlahPenumpang, this.totalTarif);

    void cetakStruk(){
      print("\n=====STRUK PEMESANAN=====");
      print("ID Pemesanan: $idPemesanan");
      print("Nama Pelanggan : $namaPelanggan");
      print("Transportasi: ${transportasi.nama}");
      print("Jumlah Penumpang: $jumlahPenumpang");
      print("Total Pembayaran: Rp${totalTarif.toStringAsFixed(0)}");
      print("===================\n");
    }
    Map<String, dynamic>toMap(){
      return{
        'id': idPemesanan,
        'pelanggan' : namaPelanggan,
        'transportasi' : transportasi.nama,
        'penumpang' : jumlahPenumpang,
        'total': totalTarif
      };
    }
  }

  Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang){
    double total = t.hitungTarif(jumlahPenumpang);
    String id = "PM${DateTime.now().millisecondsSinceEpoch % 10000}";
    return Pemesanan(id, nama, t, jumlahPenumpang, total);
  }

  void tampilSemuaPemesanan(List<Pemesanan>daftar){
    print("===Riwayat Pemesanan");
    for (var p in daftar){
      print("${p.idPemesanan} | ${p.namaPelanggan} | ${p.transportasi.nama} | ${p.jumlahPenumpang} | Rp${p.totalTarif.toStringAsFixed(0)}");
    }
    print("==========");
  }

  double hitungJarakDarat(String dari, String ke){
    Map<String, double>jarak={
      "Jakarta ke Bogor": 55,
      "Jakarta ke Depok": 25,
      "Jakarta ke Bekasi": 40,
    };
    return jarak["$dari ke $ke"] ?? jarak["$ke ke $dari"] ?? 10;
  }

  double hitungJarakUdara(String dari, String ke){
    Map<String, double>jarak={
      "Jakarta ke Surabaya": 660,
      "Jakarta ke Bali": 980,
      "Jakarta ke Medan": 1400,
    };
    return jarak["$dari $ke"] ?? jarak["$ke $dari"] ?? 500;
  }

  void main(){
    print("===Selamat Datang di Aplikasi SmartRide===");
    stdout.write("Masukkan nama pelanggan: ");
    String? nama = stdin.readLineSync();
    stdout.write("Jumlah Penumpang: ");
    int jml = int.parse(stdin.readLineSync()!);

    print("\nPilih Transportasi");
    print("1. Taksi");
    print("2. Bus");
    print("3. Pesawat");
    stdout.write("Masukkan Pilihan(1-3): ");
    int pilih = int.parse(stdin.readLineSync()!);

    List<Pemesanan>daftar= [];
    Transportasi?t;

    switch(pilih){
      case 1:
      t = Taksi("T01", "Bluebird", 8000, 4, "Jakarta", "Bogor");
      break;

      case 2:
      t = Bus("B01", "Trans", 20000, 40, true, "Bogor");
      break;

      case 3:
      t = Pesawat("P01", "Garuda Indonesia", 1200000, 660, "Ekonomi", "Jakarta", "Surabaya");
      break;

      default:
      print("pilihan tidak valid");
      return;
    }

    Pemesanan p = buatPemesanan(t, nama ??"Anonim", jml);
    daftar.add(p);

    t.tampilInfo();
    p.cetakStruk();
    tampilSemuaPemesanan(daftar);
}