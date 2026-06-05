class Movie {
  final String id;
  final String title;
  final String imagePath; // imagen local en assets/images/
  final String genre;
  final double rating;
  final bool isNew;
  final int? trendingRank;

  const Movie({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.genre,
    required this.rating,
    this.isNew = false,
    this.trendingRank,
  });
}

class ContentCategory {
  final String id;
  final String title;
  final List<Movie> movies;

  const ContentCategory({
    required this.id,
    required this.title,
    required this.movies,
  });
}

class Feature {
  final String title;
  final String description;
  final String iconPath; // imagen local en assets/images/icons/
  final List<int> gradientColors;

  const Feature({
    required this.title,
    required this.description,
    required this.iconPath,
    required this.gradientColors,
  });
}

class FaqItem {
  final String question;
  final String answer;

  const FaqItem({required this.question, required this.answer});
}

class AppData {
  static final List<Movie> trendingMovies = [
    Movie(
      id: 't1',
      title: 'Intercambiados',
      imagePath: 'assets/images/trending_1.jpg',
      // ← coloca aquí tu imagen
      genre: 'Animación',
      rating: 8.2,
      trendingRank: 1,
    ),
    Movie(
      id: 't2',
      title: 'Michael Jackson: El Veredicto',
      imagePath: 'assets/images/trending_2.jpg',
      genre: 'Documental',
      rating: 7.9,
      trendingRank: 2,
    ),
    Movie(
      id: 't3',
      title: 'Berlín',
      imagePath: 'assets/images/trending_3.jpg',
      genre: 'Thriller',
      rating: 8.5,
      trendingRank: 3,
    ),
    Movie(
      id: 't4',
      title: 'Turbulencia en la Oficina',
      imagePath: 'assets/images/trending_4.jpg',
      genre: 'Comedia',
      rating: 7.4,
      trendingRank: 4,
    ),
    Movie(
      id: 't5',
      title: 'Un Amor que no Se',
      imagePath: 'assets/images/trending_5.jpg',
      genre: 'Romance',
      rating: 7.1,
      trendingRank: 5,
    ),
  ];

  static final List<ContentCategory> categories = [
    ContentCategory(
      id: 'cat1',
      title: 'Series Populares',
      movies: [
        Movie(
          id: 'c1_1',
          title: 'La Casa de Papel',
          imagePath: 'assets/images/series_1.jpg',
          genre: 'Thriller',
          rating: 8.3,
        ),
        Movie(
          id: 'c1_2',
          title: 'Stranger Things',
          imagePath: 'assets/images/series_2.jpg',
          genre: 'Sci-Fi',
          rating: 8.7,
          isNew: true,
        ),
        Movie(
          id: 'c1_3',
          title: 'Élite',
          imagePath: 'assets/images/series_3.jpg',
          genre: 'Drama',
          rating: 7.4,
        ),
        Movie(
          id: 'c1_4',
          title: 'Peaky Blinders',
          imagePath: 'assets/images/series_4.jpg',
          genre: 'Drama',
          rating: 8.8,
        ),
        Movie(
          id: 'c1_5',
          title: 'Dark',
          imagePath: 'assets/images/series_5.jpg',
          genre: 'Misterio',
          rating: 8.8,
        ),
      ],
    ),
    ContentCategory(
      id: 'cat2',
      title: 'Películas de Acción',
      movies: [
        Movie(
          id: 'c2_1',
          title: 'Extraction',
          imagePath: 'assets/images/action_1.jpg',
          genre: 'Acción',
          rating: 6.7,
          isNew: true,
        ),
        Movie(
          id: 'c2_2',
          title: 'Red Notice',
          imagePath: 'assets/images/action_2.jpg',
          genre: 'Acción',
          rating: 6.3,
        ),
        Movie(
          id: 'c2_3',
          title: 'The Gray Man',
          imagePath: 'assets/images/action_3.jpg',
          genre: 'Thriller',
          rating: 6.5,
        ),
        Movie(
          id: 'c2_4',
          title: 'Luther',
          imagePath: 'assets/images/action_4.jpg',
          genre: 'Crimen',
          rating: 7.2,
        ),
        Movie(
          id: 'c2_5',
          title: 'Triple Frontera',
          imagePath: 'assets/images/action_5.jpg',
          genre: 'Acción',
          rating: 6.5,
        ),
      ],
    ),
    ContentCategory(
      id: 'cat3',
      title: 'Solo en Esta Plataforma',
      movies: [
        Movie(
          id: 'c3_1',
          title: 'Perfil Falso',
          imagePath: 'assets/images/exclusive_1.jpg',
          genre: 'Romance',
          rating: 7.0,
        ),
        Movie(
          id: 'c3_2',
          title: 'Pasión de Gavilanes',
          imagePath: 'assets/images/exclusive_2.jpg',
          genre: 'Romance',
          rating: 8.1,
        ),
        Movie(
          id: 'c3_3',
          title: 'Sangre Asesina',
          imagePath: 'assets/images/exclusive_3.jpg',
          genre: 'Crimen',
          rating: 7.3,
        ),
        Movie(
          id: 'c3_4',
          title: 'Valle Salvaje',
          imagePath: 'assets/images/exclusive_4.jpg',
          genre: 'Drama',
          rating: 7.6,
        ),
        Movie(
          id: 'c3_5',
          title: 'Compañeras de Cuarto',
          imagePath: 'assets/images/exclusive_5.jpg',
          genre: 'Comedia',
          rating: 7.8,
        ),
      ],
    ),
  ];

  static final List<Map<String, dynamic>> features = [
    {
      'title': 'Disfruta en tu TV',
      'description':
          'Ve en Smart TV, PlayStation, Xbox, Chromecast, Apple TV, reproductores Blu-ray y más.',
      'iconPath': 'assets/images/icon_tv.png',
      // ← coloca ícono aquí
      'gradientStart': 0xFF2D1B69,
      'gradientEnd': 0xFF11998E,
    },
    {
      'title': 'Descarga y ve offline',
      'description':
          'Guarda tu contenido favorito y siempre tendrás algo para ver.',
      'iconPath': 'assets/images/icon_download.png',
      'gradientStart': 0xFF8B1A8B,
      'gradientEnd': 0xFFE91E8C,
    },
    {
      'title': 'Disfruta donde quieras',
      'description': 'Contenido ilimitado en tu teléfono, tablet, laptop y TV.',
      'iconPath': 'assets/images/icon_devices.png',
      'gradientStart': 0xFF1A1A4E,
      'gradientEnd': 0xFF7B2FBE,
    },
    {
      'title': 'Perfiles para niños',
      'description':
          'Los niños vivirán aventuras con sus personajes favoritos en un espacio exclusivo para ellos.',
      'iconPath': 'assets/images/icon_kids.png',
      'gradientStart': 0xFF2E1760,
      'gradientEnd': 0xFFF7971E,
    },
  ];

  static final List<FaqItem> faqs = [
    FaqItem(
      question: '¿Qué es esta plataforma?',
      answer:
          'Es un servicio de entretenimiento por suscripción que te permite ver una amplia variedad de series, películas, documentales y más en miles de dispositivos conectados a internet.',
    ),
    FaqItem(
      question: '¿Cuánto cuesta la suscripción?',
      answer:
          'Mira en cualquier dispositivo. Sin compromisos. Los planes desde S/ 28.90 al mes. Sin costos adicionales ni contratos.',
    ),
    FaqItem(
      question: '¿Dónde puedo ver el contenido?',
      answer:
          'Mira donde quieras, cuando quieras. Inicia sesión con tu cuenta para ver contenido al instante en streaming desde netflix.com en tu computadora, o en cualquier dispositivo con internet.',
    ),
    FaqItem(
      question: '¿Cómo cancelo mi suscripción?',
      answer:
          'No hay ningún contrato ni compromisos. Puedes cancelar tu cuenta fácilmente en línea con dos clics. No hay cargos por cancelación.',
    ),
    FaqItem(
      question: '¿Qué puedo ver?',
      answer:
          'Tiene una amplia biblioteca de largometrajes, documentales, series, anime, originales que han ganado premios y mucho más.',
    ),
    FaqItem(
      question: '¿Es adecuado para los niños?',
      answer:
          'La experiencia infantil está incluida en tu suscripción. Los perfiles para niños tienen un PIN que te da control parental.',
    ),
  ];

  static final Map<String, List<String>> footerLinks = {
    'Soporte': [
      'Preguntas frecuentes',
      'Centro de ayuda',
      'Cuenta',
      'Prensa',
    ],
    'Empresa': [
      'Relaciones con inversionistas',
      'Empleo',
      'Canjear tarjetas',
      'Comprar tarjetas',
    ],
    'Legal': [
      'Formas de ver',
      'Términos de uso',
      'Privacidad',
      'Prueba de velocidad',
    ],
    'Info': [
      'Información corporativa',
      'Contáctanos',
      'Preferencias de cookies',
      'Avisos legales',
    ],
  };
}