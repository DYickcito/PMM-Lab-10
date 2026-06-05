import 'package:flutter/material.dart';
import '../models/app_data.dart';
import '../theme/app_theme.dart';

// ─────────────────────────────────────────────────────────────
//  PANTALLA DE DETALLE  (destino de rutas nombradas)
//  Ruta: /detail  — recibe un Movie como argumento
// ─────────────────────────────────────────────────────────────
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    // Recibe el objeto Movie enviado desde la ruta
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      backgroundColor: AppTheme.darkBg,
      body: CustomScrollView(
        slivers: [
          // ── AppBar con imagen de fondo ───────────────────
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: AppTheme.darkBg,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    movie.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppTheme.cardBg2,
                      child: const Icon(
                        Icons.movie,
                        color: AppTheme.textMuted,
                        size: 64,
                      ),
                    ),
                  ),
                  // Gradiente sobre la imagen
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, AppTheme.darkBg],
                        stops: [0.5, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Contenido del detalle ────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  // Género + rating
                  Row(
                    children: [
                      _Badge(label: movie.genre),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFC107),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${movie.rating}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xFFFFC107),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Botón reproducir
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow_rounded, size: 24),
                      label: Text(
                        'Reproducir',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Botón mi lista
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 22),
                      label: Text(
                        'Mi Lista',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          color: AppTheme.textSecondary,
                          width: 1,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Descripción placeholder
                  Text(
                    'Descripción',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Una historia apasionante que te mantendrá al filo de tu asiento. '
                    'Disfruta de este contenido exclusivo disponible solo en esta plataforma.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.cardBg2,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppTheme.textSecondary,
          fontSize: 11,
        ),
      ),
    );
  }
}