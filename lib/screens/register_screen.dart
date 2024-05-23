import 'package:edspert_course/core/appcolors.dart';
import 'package:edspert_course/core/constant.dart';
import 'package:edspert_course/presentation/manager/auth/auth_bloc.dart';
import 'package:edspert_course/screens/home_nav_screen.dart';
import 'package:edspert_course/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

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
  String selectedGender = "Laki-Laki";

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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterGoogleSuccess) {
            showMessageDialog(
              context,
              size,
              message: "Registrasi Berhasil",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                        child: const HomeNavScreen(),
                        type: PageTransitionType.leftToRight),
                    (route) => false);
              },
            );
          }

          if (state is RegisterGoogleError) {
            showMessageDialog(
              context,
              size,
              message: "Register Gagal, Coba Lagi",
              onTap: () => Navigator.pop(context),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formRegisKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  const Gap(16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        label: Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        label: Text(
                      "Nama Lengkap",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                        onTap: () {
                          setState(() {
                            selectedGender = "Laki-Laki";
                          });
                        },
                      ),
                      _buildButtonGender(
                        context,
                        title: "Perempuan",
                        onTap: () {
                          setState(() {
                            selectedGender = "Perempuan";
                          });
                        },
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
                              value: e,
                              child: Text(
                                "$e",
                                style: Theme.of(context).textTheme.bodyMedium,
                              )))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedKelas = value!;
                        });
                      }),
                  const Gap(16),
                  TextFormField(
                    controller: _sekolahController,
                    decoration: const InputDecoration(
                        label: Text(
                      "Nama Sekolah",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                Map<String, dynamic> dataUser = {
                  "nama_lengkap": _nameController.text,
                  "email": _emailController.text,
                  "nama_sekolah": _sekolahController.text,
                  "kelas": selectedKelas,
                  "gender": selectedGender,
                  "foto": "",
                  "jenjang": ""
                };
                context.read<AuthBloc>().add(RegisterWithGoogleEvent(dataUser));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 1,
                child: Container(
                  height: 60,
                  decoration: customBoxDecoration(
                      context: context, borderCircularSize: 25),
                  child: Center(
                    child: Text(
                      "DAFTAR",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
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
