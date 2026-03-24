# myapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Crea una aplicación en Flutter (Dart) en un solo archivo main.dart que muestre un GridView de 2 columnas × 7 filas (total 14 tarjetas) con imágenes desde URLs de GitHub.

Requisitos:

1. DATOS DE CADA TARJETA (14 animes):
   INVESTIGA LOS GÉNEROS REALES de cada anime (no inventes géneros). Busca información precisa sobre cada título para determinar su género principal o combinación de géneros.

   Las imágenes están en estas URLs:
   1. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/ASilenceVoice.jpeg → "A Silent Voice"
   2. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/BlackClover.jpeg → "Black Clover"
   3. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/Bleach.jpeg → "Bleach"
   4. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/DanDaDan.jpeg → "Dan Da Dan"
   5. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/DeathNote.jpeg → "Death Note"
   6. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/DemonSlayer.jpeg → "Demon Slayer"
   7. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/Dr%20stone.jpeg → "Dr. Stone"
   8. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/HunterXHunter.jpeg → "Hunter X Hunter"
   9. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/MobPsycho.jpeg → "Mob Psycho 100"
   10. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/MyHeroAcademia.jpeg → "My Hero Academia"
   11. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/Naruto.jpeg → "Naruto"
   12. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/aot.png → "Attack on Titan"
   13. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/dragon-ball-super.jpg → "Dragon Ball Super"
   14. https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/fire%20force.jpg → "Fire Force"

   Para CADA UNO, asigna:
   - Título: nombre del anime
   - Subtítulo: género(s) REAL(es) del anime (ej: Shonen, Drama, Seinen, Comedia, Romance, Thriller, etc.)
   - Calificación: valor de estrellas (del 1 al 5, puedes asignar según popularidad general)

2. ESTRUCTURA DE CADA TARJETA:
   - Parte superior: imagen redondeada (aspect ratio 16:9, ClipRRect con borderRadius 12px)
   - Parte inferior (dentro del mismo Card):
     * Fila 1: Título (negrita, tamaño 14, color blanco)
     * Fila 2: Subtítulo/Género (texto secundario, tamaño 12, color gris claro)
     * Fila 3: Widget de calificación con estrellas (5 estrellas)

3. ESTILO VISUAL (Inspiración Crunchyroll):
   - Fondo principal: gris oscuro (#121212)
   - Color de acento: naranja sutil (#FF8C42)
   - Tarjetas: fondo #1E1E1E o #2D2D2D
   - Texto títulos: blanco (#FFFFFF)
   - Texto subtítulos: gris claro (#B0B0B0)
   - Bordes redondeados: 12-16px
   - Sombras suaves
   - AppBar: fondo negro con acento naranja, título "Crunchyroll"

4. REQUISITOS TÉCNICOS:
   - Usar GridView.builder con crossAxisCount: 2
   - Manejar carga de imágenes con NetworkImage y placeholder de carga
   - Implementar calificación con estrellas usando Icon(Icons.star, Icons.star_half, Icons.star_border)
   - Agregar efecto de elevación al tocar la tarjeta (InkWell o GestureDetector)
   - Hacer responsive: ajustar padding según tamaño de pantalla
   - Usar SafeArea y evitar desbordamientos

5. ENTREGA:
   Genera el código completo de main.dart listo para copiar y pegar en un proyecto Flutter nuevo.
   Asegúrate de que la app compile sin errores y muestre correctamente los 14 animes en 2 columnas × 7 filas.
