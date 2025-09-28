Nama: Riskawati Syamsuddin Bago  
NPM: 07352311171

Program Sistem Penilaian Mahasiswa dengan Conditional Statement
---

Deskripsi:  
---
Program ini dibuat menggunakan bahasa Dart untuk menentukan nilai akhir mahasiswa dalam bentuk huruf (grade) berdasarkan skor ujian yang dimasukkan oleh pengguna. Program akan meminta input berupa angka dari 0 sampai 100, kemudian melakukan validasi agar skor yang dimasukkan tidak kurang dari 0 atau lebih dari 100. Jika skor valid, program akan menggunakan conditional statement (if-else) untuk mengelompokkan skor ke dalam grade A, B, C, D, atau E sesuai ketentuan yang telah ditentukan. Hasil akhirnya akan menampilkan skor numerik yang dimasukkan beserta grade huruf yang sesuai.  

Alur Kerja Program:
---
1. Program meminta pengguna untuk memasukkan skor ujian (0 – 100).
2. Program memvalidasi skor:
   - Jika skor < 0 atau > 100 → tampilkan pesan error.
   - Jika skor valid → lanjut ke langkah berikutnya.
3. Program mengecek skor dengan if-else (atau switch-case) untuk menentukan grade:
   - Skor 85 – 100 → A
   - Skor 70 – 84 → B
   - Skor 60 – 69 → C
   - Skor 50 – 59 → D
   - Skor < 50 → E
4. Program menampilkan hasil berupa skor numerik dan grade huruf dengan format:
   - Skor Anda: (nilai)
   - Grade Anda: (grade)

Cara Menjalankan Program:
---
1. Pastikan Dart sudah terinstal di komputer (cek dengan perintah dart --version di terminal).
2. Simpan kode program ke dalam file dengan ekstensi .dart, misalnya penilaian.dart.
3. Buka terminal atau command prompt, lalu arahkan ke folder tempat file disimpan.
4. Jalankan program dengan perintah: dart penilaian.dart
5. Masukkan skor yang diminta, lalu program akan menampilkan hasil grade sesuai skor.

