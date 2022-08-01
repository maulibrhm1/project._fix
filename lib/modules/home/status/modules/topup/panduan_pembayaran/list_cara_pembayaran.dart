part of 'panduan.dart';

int panduanIndex = 0;

List<Widget> topupDescription = const [
  TopupDescription(
    text: '1. Buka aplikasi OVO dan Login\n'
        '2. Pilih menu transfer\n'
        '3. Pilih ke Rekening Bank\n'
        '4. Pada pilihan Bank tujuan transfer pilih bank Mandiri\n'
        '5. Masukkan 008 + Nomor rekening tujuan contoh 008180009341512\n'
        '6. Masukkan jumlah Tranfer sebanyak Rp 400.000\n'
        '7. Untuk kolom pesan, opsional boleh diisi atau dikosongkan\n'
        '8. Pilih Tombol "Lanjutkan"\n'
        '9. Cek nominal transfer dan tujuan\n'
        '10. Jika sudah benar, pilih transfer\n'
        '11. Tunggu hingga muncul keterangan Transaksi Anda Berhasil\n'
        '12. dan pembayaran pun telah selesai',
  ),
  TopupDescription(
      text: '1. Buka aplikasi DANA\n'
          '2. Pilih menu kirim dari halaman utama\n'
          '3. Klik sub menu Rekening Bank\n'
          '4. Pilih Bank tujuan untuk transfer\n'
          '5. Isi nomor rekening tujuan transfer\n'
          '6. Isi jumlah nominal uang yang akan ditransfer\n'
          '7. Cek kembali nomor Rekening Bank\n'
          '8. Masukkan Pin DANA\n'
          '9. Tunggu Proses transfer DANA selesai\n'),
  TopupDescription(
    text: 'Kembali',
  ),
  TopupDescription(
    text: 'Izin Keluar',
  ),
  TopupDescription(
    text: 'Kembali',
  ),
  TopupDescription(
    text: 'Pulang',
  ),
  TopupDescription(
    text: 'Pulang',
  ),
  TopupDescription(
    text: 'Pulang',
  ),
  TopupDescription(
    text: 'Pulang',
  ),
  TopupDescription(
    text: 'Pulang',
  ),
];

class TopupDescription extends StatelessWidget {
  final String text;
  const TopupDescription({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(24),
      width: size.width * 0.8,
      child: Center(
        child: Text(
          text,
          style: TextStyles(context)
              .getRegularStyle()
              .copyWith(color: Colors.black),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

List<String> ovo = [
  '1. Buka aplikasi OVO dan Login',
  '2. Pilih menu transfer',
  '3. Pilih ke Rekening Bank',
  '4. Pada pilihan Bank tujuan\n    transfer pilih bank Mandiri',
  '5. Masukkan 008 + Nomor rekening\n   tujuan contoh 008180009341512',
  '6. Masukkan jumlah Tranfer\n   sebanyak Rp 400.000',
  '7. Untuk kolom pesan, opsional\n   boleh diisi atau dikosongkan',
  '8. Pilih Tombol "Lanjutkan"',
  '9. Cek nominal transfer dan tujuan',
  '10. Jika sudah benar, pilih transfer',
  '11. Tunggu hingga muncul keterangan\n    Transaksi Anda Berhasil',
  '12. dan pembayaran pun telah selesai'
];

List<String> dana = [
  '1. Buka aplikasi DANA',
  '2. Pilih menu kirim dari halaman\n    utama',
  '3. Klik sub menu Rekening Bank',
  '4. Pilih Bank tujuan untuk transfer',
  '5. Isi nomor rekening tujuan transfer',
  '6. Isi jumlah nominal uang yang\n     akan ditransfer',
  '7. Cek kembali nomor Rekening Bank',
  '8. Masukkan Pin DANA',
  '9. Tunggu Proses transfer DANA selesai'
];

List<String> gopay = [
  '1. Buka aplikasi Gojek',
  'klik bayar pada menu GoPay',
  '2. Lalu pilih Ke rekening bank',
  '3. Pilih Transfer instan ke rek.baru.',
  '4. Pada pilihan Bank tujuan pilih\n     Bank Mandiri',
  '5. Pilih nama pemilik rekening dan\n    klik Lanjut.',
  '6. Isi jumlah nominal uang yang\n     akan dikirimkan',
  '7. Pastikan jumlah transfer sudah benar.',
  '8. Klik Konfirmasi untuk melanjutkan\n    dan masukkan PIN kamu.',
  '9. Cek nominal transfer dan tujuan',
  '10. Tunggu hingga muncul keterangan\n     Transaksi Anda Berhasil'
];
