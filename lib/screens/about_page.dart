import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header profil
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 55,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Arjuna Meiureksa',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  const SizedBox(height: 5),

                  const Text('Mahasiswa Teknik Informatika'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Pendidikan
            buildTitle(context, 'Riwayat Pendidikan'),

            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text('Perguruan Tinggi'),
                    subtitle: Text(
                      'Global Institute of Technology and Business',
                    ),
                  ),

                  Divider(height: 1),

                  ListTile(
                    leading: Icon(Icons.menu_book),
                    title: Text('SMA / SMK'),
                    subtitle: Text('SMK PGRI 2 KOTA TANGERANG'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Keahlian
            buildTitle(context, 'Keahlian'),

            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.code),
                    title: Text('Dart dan Flutter'),
                    subtitle: Text('Pengembangan aplikasi mobile'),
                  ),

                  ListTile(
                    leading: Icon(Icons.computer),
                    title: Text('Pemrograman'),
                    subtitle: Text('Dasar pemrograman'),
                  ),

                  ListTile(
                    leading: Icon(Icons.design_services),
                    title: Text('UI Design'),
                    subtitle: Text('Dasar perancangan tampilan aplikasi'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Hobi
            buildTitle(context, 'Hobi'),

            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.sports_esports),
                    title: Text('Bermain Game'),
                  ),

                  ListTile(
                    leading: Icon(Icons.laptop),
                    title: Text('Ngoding'),
                  ),

                  ListTile(
                    leading: Icon(Icons.movie),
                    title: Text('Menonton Anime'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}