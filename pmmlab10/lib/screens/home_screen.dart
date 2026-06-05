import 'package:flutter/material.dart';
import '../models/app_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import 'detail_screen.dart';

// ─────────────────────────────────────────────────────────────
//  PANTALLA PRINCIPAL — HomeScreen
//  Ruta: /  (raíz)
// ─────────────────────────────────────────────────────────────
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: _GradientAppBar(),
            title: _Logo(),
            actions: [
              // Selector de idioma
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.language,
                  color: AppTheme.textPrimary,
                  size: 16,
                ),
                label: Text(
                  'Español',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.textPrimary,
                    fontSize: 13,
                  ),
                ),
              ),
              // Botón iniciar sesión
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryRed,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'Iniciar sesión',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ── Hero Banner ────────────────────────────────────
          SliverToBoxAdapter(child: _HeroBanner()),

          // ── Tendencias ─────────────────────────────────────
          SliverToBoxAdapter(child: _TrendingSection()),

          // ── Categorías (ListView por cada una) ────────────
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final category = AppData.categories[index];
              return _CategorySection(category: category);
            }, childCount: AppData.categories.length),
          ),

          // ── Más motivos para unirse ────────────────────────
          SliverToBoxAdapter(child: _FeaturesSection()),

          // ── Preguntas frecuentes ───────────────────────────
          SliverToBoxAdapter(child: _FAQSection()),

          // ── CTA email final ────────────────────────────────
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: EmailCTABar(),
            ),
          ),

          // ── Footer ─────────────────────────────────────────
          SliverToBoxAdapter(child: _Footer()),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  APP BAR — gradiente superior
// ═══════════════════════════════════════════════════════════════
class _GradientAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xCC0D0D0D), Colors.transparent],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  LOGO
// ═══════════════════════════════════════════════════════════════
class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opción A: imagen local del logo
        // Image.asset('assets/images/logo.png', height: 28)

        // Opción B: texto estilizado (por si no tienes imagen de logo)
        Text(
          'STREAMIX',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontSize: 26,
            color: AppTheme.primaryRed,
            letterSpacing: 3,
          ),
        ),
      ],
    );
  }
}

class _HeroBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.75,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/image_background.jpg',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: const Color(0xFF111111),
              child: const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  color: AppTheme.textMuted,
                  size: 80,
                ),
              ),
            ),
          ),
          // ── Gradiente inferior ───────────────────────────
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, AppTheme.darkBg],
                stops: [0.4, 1.0],
              ),
            ),
          ),
          // ── Contenido textual centrado ───────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
              child: Column(
                children: [
                  Text(
                    'Películas y series\nilimitadas y mucho más',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 38,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'A partir de S/ 28.90. Cancela cuando quieras.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const EmailCTABar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  SECCIÓN TENDENCIAS
// ═══════════════════════════════════════════════════════════════
class _TrendingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Tendencias'),
        // ListView horizontal con TrendingCard
        SizedBox(
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: AppData.trendingMovies.length,
            itemBuilder: (context, index) {
              final movie = AppData.trendingMovies[index];
              return TrendingCard(
                movie: movie,
                onTap: () => Navigator.pushNamed(
                  context,
                  DetailScreen.routeName,
                  arguments: movie,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  SECCIÓN CATEGORÍA (ListView horizontal con MovieCards)
// ═══════════════════════════════════════════════════════════════
class _CategorySection extends StatelessWidget {
  final ContentCategory category;
  const _CategorySection({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: category.title, onSeeAll: () {}),
        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: category.movies.length,
            itemBuilder: (context, index) {
              final movie = category.movies[index];
              return MovieCard(
                movie: movie,
                onTap: () => Navigator.pushNamed(
                  context,
                  DetailScreen.routeName,
                  arguments: movie,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  SECCIÓN FEATURES — "Más motivos para unirte"
// ═══════════════════════════════════════════════════════════════
class _FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Más motivos para unirte'),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // Iteramos sobre la Lista de Mapas AppData.features
            itemCount: AppData.features.length,
            itemBuilder: (context, index) {
              return FeatureCard(feature: AppData.features[index]);
            },
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  SECCIÓN FAQ — Preguntas frecuentes
// ═══════════════════════════════════════════════════════════════
class _FAQSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Preguntas frecuentes'),
          // ListView de FAQTiles (ListTiles expandibles)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppData.faqs.length,
            itemBuilder: (context, index) {
              return FAQTile(faq: AppData.faqs[index]);
            },
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  FOOTER
// ═══════════════════════════════════════════════════════════════
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.darkBg,
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Teléfono
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: const [
                TextSpan(text: '¿Preguntas? Llama al '),
                TextSpan(
                  text: '0 800 55821',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: AppTheme.dividerColor),
          const SizedBox(height: 16),
          // Links del footer usando el Mapa AppData.footerLinks
          ...AppData.footerLinks.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Wrap(
                spacing: 16,
                runSpacing: 8,
                children: entry.value.map((link) {
                  return GestureDetector(
                    onTap: () {},
                    child: Text(
                      link,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppTheme.textMuted,
                        color: AppTheme.textMuted,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
          const SizedBox(height: 16),
          // Selector idioma
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.textMuted),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.language,
                  color: AppTheme.textMuted,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  'Español',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.textMuted,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppTheme.textMuted,
                  size: 16,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Esta página está protegida por Google reCAPTCHA para comprobar que no eres un robot.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 11,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}