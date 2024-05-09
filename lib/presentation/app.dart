



import 'package:edspert_course/data/repositories/auth_repository_impl.dart';
import 'package:edspert_course/domain/usecases/is_signed_in_with_google_usecase.dart';
import 'package:edspert_course/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';
import '../domain/repositories/domain_repositories.dart';
import '../screens/splash.dart';
import 'manager/home_nav/cubit/home_nav_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            // AuthDataSource authDataSource = AuthDataSource();
            AuthRepository authRepository =AuthRepositoryImple();
            return AuthBloc(
              IsSignedInWithGoogleUsecase(authRepository),
              SignInWithGoogleUseCase(authRepository),
            );
          },
        ),
        BlocProvider(create: (context) => HomeNavCubit()),
        BlocProvider(
          create: (context) => ProfileBloc(
            UploadImageUsecase(ProfileRepositoryImpl()),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
