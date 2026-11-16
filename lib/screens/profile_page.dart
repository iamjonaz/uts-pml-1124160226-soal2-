
import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../theme_controller.dart';
import 'edit_profilepage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile profile;

  @override
  void initState() {
    super.initState();

    profile = Profile(
      nama: 'Arjuna Meiureksa',
      nim: '1124160226',
      prodi: 'Teknik Informatika',
      kelas: 'Software Engineering',
      bio: 'Saya adalah mahasiswa Teknik Informatika yang memiliki '
          'ketertarikan pada dunia teknologi, pemrograman, dan '
          'pengembangan aplikasi mobile.',
      email: 'jonazhell06@gmail.com',
      nomorHp: '085697136932',
      github: 'iamjonaz',
      fotoAsset: 'assets/images/foto_profil.jpg',
    );
  }

  // Fungsi untuk mengedit profil
  void editProfile() async {
    final Profile? dataBaru = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          profile: profile,
        ),
      ),
    );

    if (!mounted) return;

    if (dataBaru != null) {
      setState(() {
        profile = dataBaru;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profil berhasil diperbarui'),
        ),
      );
    }
  }

  // Fungsi untuk logout
  void logout() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          // Tombol Edit Profil
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profil',
            onPressed: editProfile,
          ),

          // Switch Light Mode dan Dark Mode
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, mode, child) {
              return Switch(
                value: mode == ThemeMode.dark,
                onChanged: (value) {
                  themeNotifier.value = value
                      ? ThemeMode.dark
                      : ThemeMode.light;
                },
              );
            },
          ),
        ],
      ),

      // Drawer Navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 50,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    profile.nama,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),

                  const Text(
                    'Profil Mahasiswa',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: logout,
            ),
          ],
        ),
      ),

      // Isi Halaman Profil
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Foto Profil
            CircleAvatar(
              radius: 55,
              child: ClipOval(
                child: Image.asset(
                  profile.fotoAsset,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      size: 60,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Nama
            Text(
              profile.nama,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text('NIM: ${profile.nim}'),
            Text('Program Studi: ${profile.prodi}'),
            Text('Kelas: ${profile.kelas}'),

            const SizedBox(height: 24),

            // Tentang Saya
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tentang Saya',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    const SizedBox(height: 10),

                    Text(profile.bio),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Informasi Kontak
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('Email'),
                    subtitle: Text(profile.email),
                  ),

                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Nomor HP'),
                    subtitle: Text(profile.nomorHp),
                  ),

                  ListTile(
                    leading: const Icon(Icons.school),
                    title: const Text('Program Studi'),
                    subtitle: Text(profile.prodi),
                  ),

                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('GitHub'),
                    subtitle: Text(profile.github),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Terima kasih telah melihat profil saya',
              ),
            ),
          );
        },
        tooltip: 'Terima kasih',
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
