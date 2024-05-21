import 'package:edspert_course/core/appcolors.dart';
import 'package:edspert_course/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formRegisKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _sekolahController = TextEditingController();
  List<int> kelas = List.generate(11, (index) => index + 1);

  int selectedKelas = 1;

  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = sizeMedia(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _sekolahController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yuk isi data diri"),
      ),
      body: Form(
        key: _formRegisKey,
        child: ListView(
          children: [
            const Gap(16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  label: Text(
                "Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )),
            ),
            const Gap(16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  label: Text(
                "Nama Lengkap",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )),
            ),
            Text(
              "Jenis Kelamin",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonGender(
                  context,
                  title: "Laki-Laki",
                  onTap: () {},
                ),
                _buildButtonGender(
                  context,
                  title: "Perempuan",
                  onTap: () {},
                ),
              ],
            ),
            const Gap(16),
            Text(
              "Kelas",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            DropdownButtonFormField(
                items: kelas
                    .map((e) => DropdownMenuItem(
                            child: Text(
                          "$e",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedKelas = value;
                  });
                }),
            const Gap(16),
          ],
        ),
      ),
    );
  }

  InkWell _buildButtonGender(BuildContext context,
      {required String title, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }
}
