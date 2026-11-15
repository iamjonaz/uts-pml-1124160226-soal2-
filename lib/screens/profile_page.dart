import 'package:flutter/material.dart';

import '../models/profile.dart';
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
      bio: 'main game dikit ama ngoding',
      email: 'jonazhell06@gmail.com',
      nomorHp: '085697136932',
      github: 'iamjonaz',
    );
  }

void editProfile() async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditProfilePage(
        profile: profile,
      ),
    ),
  );

  if (result == true) {
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil berhasil diperbarui'),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profil',
            onPressed: editProfile,
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Tentang Saya',
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 16),

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
    );
  }
}