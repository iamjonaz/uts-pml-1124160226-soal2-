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
            const Center(
              child: CircleAvatar(
                radius: 45,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Center(
              child: Text(
                'Arjuna Meiureksa',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Tentang Saya',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            const Text(
              'main game dikit ama ngoding',
            ),

            const SizedBox(height: 24),

            Text(
              'Pendidikan',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text('Perguruan Tinggi'),
                subtitle: Text('Program Studi Teknik Informatika'),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Keahlian',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.code),
                    title: Text('Dart dan Flutter'),
                  ),
                  ListTile(
                    leading: Icon(Icons.computer),
                    title: Text('Pemrograman'),
                  ),
                  ListTile(
                    leading: Icon(Icons.design_services),
                    title: Text('UI/UX Design'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Hobi',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.sports_esports),
                    title: Text('Bermain Game'),
                  ),
                  ListTile(
                    leading: Icon(Icons.movie),
                    title: Text('Menonton Film dan Anime'),
                  ),
                  ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text('Mendengarkan Musik'),
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