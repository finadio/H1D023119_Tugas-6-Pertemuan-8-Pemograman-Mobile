// ui/form_data.dart
import 'package:flutter/material.dart';
import 'package:h1d023119_tugas6/ui/tampil_data.dart';

class FormDataScreen extends StatefulWidget {
  const FormDataScreen({super.key});

  @override
  State<FormDataScreen> createState() => _FormDataScreenState();
}

class _FormDataScreenState extends State<FormDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _tahunController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunController.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_formKey.currentState?.validate() ?? false) {
      String nama = _namaController.text;
      String nim = _nimController.text;
      int tahun = int.parse(_tahunController.text);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TampilData(nama: nama, nim: nim, tahun: tahun),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.person, size: 50, color: Colors.blue),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _namaController,
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _nimController,
                      decoration: const InputDecoration(
                        labelText: 'NIM',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.badge_outlined),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _tahunController,
                      decoration: const InputDecoration(
                        labelText: 'Tahun Lahir',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _simpan,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
