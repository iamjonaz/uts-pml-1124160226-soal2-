import 'package:flutter/material.dart';

import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController nimController;
  late TextEditingController prodiController;
  late TextEditingController kelasController;
  late TextEditingController bioController;
  late TextEditingController emailController;
  late TextEditingController nomorHpController;
  late TextEditingController githubController;

  @override
  void initState() {
    super.initState();

    namaController =
        TextEditingController(text: widget.profile.nama);
    nimController =
        TextEditingController(text: widget.profile.nim);
    prodiController =
        TextEditingController(text: widget.profile.prodi);
    kelasController =
        TextEditingController(text: widget.profile.kelas);
    bioController =
        TextEditingController(text: widget.profile.bio);
    emailController =
        TextEditingController(text: widget.profile.email);
    nomorHpController =
        TextEditingController(text: widget.profile.nomorHp);
    githubController =
        TextEditingController(text: widget.profile.github);
  }

  @override
  void dispose() {
    namaController.dispose();
    nimController.dispose();
    prodiController.dispose();
    kelasController.dispose();
    bioController.dispose();
    emailController.dispose();
    nomorHpController.dispose();
    githubController.dispose();

    super.dispose();
  }

  void simpanProfil() {
    if (formKey.currentState!.validate()) {
      widget.profile.nama = namaController.text;
      widget.profile.nim = nimController.text;
      widget.profile.prodi = prodiController.text;
      widget.profile.kelas = kelasController.text;
      widget.profile.bio = bioController.text;
      widget.profile.email = emailController.text;
      widget.profile.nomorHp = nomorHpController.text;
      widget.profile.github = githubController.text;

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),

      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              buildField(
                namaController,
                'Nama',
              ),

              buildField(
                nimController,
                'NIM',
              ),

              buildField(
                prodiController,
                'Program Studi',
              ),

              buildField(
                kelasController,
                'Kelas',
              ),

              buildField(
                bioController,
                'Bio',
                maxLines: 3,
              ),

              buildField(
                emailController,
                'Email',
              ),

              buildField(
                nomorHpController,
                'Nomor HP',
              ),

              buildField(
                githubController,
                'GitHub',
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: simpanProfil,
                  child: const Text('Simpan Perubahan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label wajib diisi';
          }

          if (label == 'Email' && !value.contains('@')) {
            return 'Email harus menggunakan @';
          }

          return null;
        },
      ),
    );
  }
}