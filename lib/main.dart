import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crunchyroll',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF8C42),
        scaffoldBackgroundColor: const Color(0xFF121212),
        fontFamily: 'Roboto',
      ),
      home: const AnimeGridScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimeGridScreen extends StatelessWidget {
  const AnimeGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crunchyroll',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 4,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Color(0xFF1E1E1E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75, // Proporción más compacta
            ),
            itemCount: animeList.length,
            itemBuilder: (context, index) {
              return AnimeCard(anime: animeList[index]);
            },
          ),
        ),
      ),
    );
  }
}

class AnimeCard extends StatelessWidget {
  final Anime anime;

  const AnimeCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xFF1E1E1E),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${anime.title} - ${anime.genre}'),
              duration: const Duration(seconds: 1),
              backgroundColor: const Color(0xFFFF8C42),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Evita expandir innecesariamente
          children: [
            // Imagen redondeada
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: FadeInImage(
                  image: NetworkImage(anime.imageUrl),
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/placeholder.png'),
                  placeholderErrorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[800],
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFFF8C42),
                        ),
                      ),
                    );
                  },
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[800],
                      child: const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Contenido de la tarjeta con padding reducido
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Título
                  Text(
                    anime.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Género
                  Text(
                    anime.genre,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFB0B0B0),
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Calificación con estrellas
                  Row(
                    children: List.generate(5, (starIndex) {
                      if (starIndex < anime.rating.floor()) {
                        return const Icon(
                          Icons.star,
                          color: Color(0xFFFF8C42),
                          size: 14,
                        );
                      } else if (starIndex < anime.rating.ceil() &&
                          anime.rating - anime.rating.floor() > 0) {
                        return const Icon(
                          Icons.star_half,
                          color: Color(0xFFFF8C42),
                          size: 14,
                        );
                      } else {
                        return const Icon(
                          Icons.star_border,
                          color: Color(0xFFFF8C42),
                          size: 14,
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Anime {
  final String title;
  final String genre;
  final double rating;
  final String imageUrl;

  Anime({
    required this.title,
    required this.genre,
    required this.rating,
    required this.imageUrl,
  });
}

// Lista de animes con géneros reales
final List<Anime> animeList = [
  Anime(
    title: 'A Silent Voice',
    genre: 'Drama, Romance, Slice of Life',
    rating: 4.8,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/ASilenceVoice.jpeg',
  ),
  Anime(
    title: 'Black Clover',
    genre: 'Shonen, Action, Fantasy, Magic',
    rating: 4.3,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/BlackClover.jpeg',
  ),
  Anime(
    title: 'Bleach',
    genre: 'Shonen, Action, Supernatural, Fantasy',
    rating: 4.5,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/Bleach.jpeg',
  ),
  Anime(
    title: 'Dan Da Dan',
    genre: 'Comedy, Supernatural, Sci-Fi, Action',
    rating: 4.7,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/DanDaDan.jpeg',
  ),
  Anime(
    title: 'Death Note',
    genre: 'Thriller, Mystery, Psychological, Supernatural',
    rating: 4.9,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/DeathNote.jpeg',
  ),
  Anime(
    title: 'Demon Slayer',
    genre: 'Shonen, Action, Historical, Supernatural',
    rating: 4.8,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/DemonSlayer.jpeg',
  ),
  Anime(
    title: 'Dr. Stone',
    genre: 'Shonen, Sci-Fi, Adventure, Comedy',
    rating: 4.6,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/Dr%20stone.jpeg',
  ),
  Anime(
    title: 'Hunter X Hunter',
    genre: 'Shonen, Action, Adventure, Fantasy',
    rating: 4.9,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/HunterXHunter.jpeg',
  ),
  Anime(
    title: 'Mob Psycho 100',
    genre: 'Seinen, Action, Comedy, Supernatural',
    rating: 4.7,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/MobPsycho.jpeg',
  ),
  Anime(
    title: 'My Hero Academia',
    genre: 'Shonen, Action, Superhero, School',
    rating: 4.6,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/MyHeroAcademia.jpeg',
  ),
  Anime(
    title: 'Naruto',
    genre: 'Shonen, Action, Adventure, Ninja',
    rating: 4.8,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/Naruto.jpeg',
  ),
  Anime(
    title: 'Attack on Titan',
    genre: 'Shonen, Action, Dark Fantasy, Drama',
    rating: 4.9,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/aot.png',
  ),
  Anime(
    title: 'Dragon Ball Super',
    genre: 'Shonen, Action, Martial Arts, Fantasy',
    rating: 4.4,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/dragon-ball-super.jpg',
  ),
  Anime(
    title: 'Fire Force',
    genre: 'Shonen, Action, Supernatural, Sci-Fi',
    rating: 4.5,
    imageUrl:
        'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/fire%20force.jpg',
  ),
];