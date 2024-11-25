import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'login.dart'; // Certifique-se de que o arquivo login.dart está presente
import 'homescreen.dart'; // Certifique-se de que o arquivo homescreen.dart está presente
import 'models/user_provider.dart'; // Certifique-se de que o arquivo user_provider.dart está presente

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyANFmroqKzNs-FrW0-VuR9VpJkQT1GK6ZY",
      appId: "1:130303227201:android:987618b1ea8ba357481dc0",
      messagingSenderId: "130303227201",
      projectId: "projetoacqa",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Projeto Flutter',
        theme: ThemeData(
          // Definição do esquema de cores
          colorScheme: ColorScheme.light(
            primary: Color.fromARGB(255, 136, 13, 161), // Cor primária
            secondary: Color.fromARGB(255, 11, 184, 175), // Cor secundária
          ),
          // Estilo do AppBar
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 126, 10, 194), // Cor do AppBar
          ),
          // Estilo do botão ElevatedButton
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Color.fromARGB(
                  255, 87, 192, 110), // Cor secundária para o botão
            ),
          ),
        ),
        // A tela inicial será determinada pelo status de autenticação do usuário
        home: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return HomeScreen(); // Se o usuário estiver autenticado, exibe a tela inicial
                  } else {
                    return LoginScreen(); // Caso contrário, exibe a tela de login
                  }
                } else {
                  return Center(
                    child:
                        CircularProgressIndicator(), // Indicador de carregamento enquanto aguarda a autenticação
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
