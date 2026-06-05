import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Barra de estado transparente
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // Solo orientación vertical (móvil)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const StreamingApp());
}

// ═══════════════════════════════════════════════════════════════
//  RAÍZ DE LA APLICACIÓN
// ═══════════════════════════════════════════════════════════════
class StreamingApp extends StatelessWidget {
  const StreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streamix',
      debugShowCheckedModeBanner: false,

      // ── Tema global ────────────────────────────────────────
      theme: AppTheme.darkTheme,

      // ── Rutas nombradas ─────────────────────────────────────
      // Se definen aquí para que cualquier pantalla pueda
      // navegar con Navigator.pushNamed(context, '/detail', arguments: movie)
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        DetailScreen.routeName: (_) => const DetailScreen(),
      },
    );
  }
}