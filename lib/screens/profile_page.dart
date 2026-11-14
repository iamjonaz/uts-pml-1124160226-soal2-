import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              'Arjuna Meiureksa',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            const Text('NIM: 1124160226'),
            const Text('Program Studi: Teknik Informatika'),
            const Text('Kelas: Software Engineering'),

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

                    const Text(
                      'main game dikit ama ngoding',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Email'),
                    subtitle: Text('jonazhell06@gmail.com'),
                  ),

                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Nomor HP'),
                    subtitle: Text('085697136932'),
                  ),

                  const ListTile(
                    leading: Icon(Icons.school),
                    title: Text('Program Studi'),
                    subtitle: Text('Teknik Informatika'),
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