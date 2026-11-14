class Profile {
  String nama;
  String nim;
  String prodi;
  String kelas;
  String bio;
  String email;
  String nomorHp;
  String github;
  String fotoAsset;

  Profile({
    this.nama = 'Nama Mahasiswa',
    this.nim = 'NIM',
    this.prodi = 'Program Studi',
    this.kelas = 'Kelas',
    this.bio = 'Tuliskan bio singkat kamu.',
    this.email = 'email@example.com',
    this.nomorHp = '081234567890',
    this.github = 'username',
    this.fotoAsset = 'assets/images/foto_profil.jpg',
  });
}