import 'package:flutter/material.dart';
import '../models/app_data.dart';
import '../theme/app_theme.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  const MovieCard({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Portada ─────────────────────────────────────
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    movie.imagePath,
                    width: 120,
                    height: 170,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _placeholderPoster(),
                  ),
                ),
                // Badge "NUEVO"
                if (movie.isNew)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryRed,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        'NUEVO',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 9,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            // ── Título ──────────────────────────────────────
            Text(
              movie.title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppTheme.textSecondary,
                fontSize: 11,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholderPoster() {
    return Container(
      width: 120,
      height: 170,
      decoration: BoxDecoration(
        color: AppTheme.cardBg2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.movie, color: AppTheme.textMuted, size: 32),
    );
  }
}

class TrendingCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  const TrendingCard({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 140,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // ── Imagen ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  movie.imagePath,
                  width: 110,
                  height: 160,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 110,
                    height: 160,
                    decoration: BoxDecoration(
                      color: AppTheme.cardBg2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.movie,
                      color: AppTheme.textMuted,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
            // ── Número grande ───────────────────────────────
            Positioned(
              bottom: 0,
              left: 0,
              child: Text(
                '${movie.trendingRank}',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 80,
                  fontFamily: 'BebasNeue',
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = AppTheme.textSecondary,
                  height: 0.85,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Text(
                '${movie.trendingRank}',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 80,
                  fontFamily: 'BebasNeue',
                  color: AppTheme.darkBg,
                  height: 0.85,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FeatureCard extends StatelessWidget {
  final Map<String, dynamic> feature;

  const FeatureCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(feature['gradientStart'] as int),
            Color(feature['gradientEnd'] as int),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Título ──────────────────────────────────────
          Text(
            feature['title'] as String,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          // ── Descripción ─────────────────────────────────
          Expanded(
            child: Text(
              feature['description'] as String,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppTheme.textSecondary,
                fontSize: 11,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // ── Ícono ────────────────────────────────────────
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              feature['iconPath'] as String,
              width: 42,
              height: 42,
              errorBuilder: (_, __, ___) => Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.tv, color: Colors.white54, size: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQTile extends StatefulWidget {
  final FaqItem faq;

  const FAQTile({super.key, required this.faq});

  @override
  State<FAQTile> createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _controller;
  late Animation<double> _expandAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _expandAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    _expanded ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          // ── ListTile como encabezado ─────────────────────
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 4,
            ),
            title: Text(
              widget.faq.question,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: AnimatedRotation(
              turns: _expanded ? 0.125 : 0,
              // 0.125 × 360° = 45°
              duration: const Duration(milliseconds: 280),
              child: const Icon(Icons.add, color: AppTheme.textPrimary),
            ),
            onTap: _toggle,
          ),
          // ── Respuesta animada ────────────────────────────
          SizeTransition(
            sizeFactor: _expandAnim,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
              child: Text(
                widget.faq.answer,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  height: 1.6,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({super.key, required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 28, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineLarge),
          if (onSeeAll != null)
            GestureDetector(
              onTap: onSeeAll,
              child: Row(
                children: [
                  Text(
                    'Ver todo',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppTheme.primaryRed,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(
                    Icons.chevron_right,
                    color: AppTheme.primaryRed,
                    size: 16,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}


class EmailCTABar extends StatelessWidget {
  const EmailCTABar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            '¿Quieres ver el contenido ya? Ingresa tu email para comenzar.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppTheme.textSecondary,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(
                    fontFamily: 'SourceSans3',
                    color: AppTheme.textPrimary,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppTheme.textMuted,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppTheme.textMuted,
                        width: 1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // ── Botón CTA ───────────────────────────────
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chevron_right, size: 20),
                label: Text(
                  'Comenzar',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryRed,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}