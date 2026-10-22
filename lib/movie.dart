
class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

final List<Movie> movies = [
  const Movie(
    title: 'Born in China',
    genre: 'Nature',
    year: 2016,
    rating: 7.0,
    image: 'assets/posters/born_in_china.jpeg',
  ),
  const Movie(
    title: 'Penguins',
    genre: 'Nature',
    year: 2019,
    rating: 7.0,
    image: 'assets/posters/penguins.jpeg',
  ),
  const Movie(
    title: 'To the Arctic',
    genre: 'Nature',
    year: 2012,
    rating: 6.7,
    image: 'assets/posters/to_the_arctic.png',
  ),
  const Movie(
    title: 'Dolphin Reef',
    genre: 'Nature',
    year: 2018,
    rating: 7.4,
    image: 'assets/posters/dolphin_reef.jpeg',
  ),
  const Movie(
    title: 'Wings of Life',
    genre: 'Nature',
    year: 2011,
    rating: 7.4,
    image: 'assets/posters/wings_of_life.jpeg',
  ),
  const Movie(
    title: 'The Crimson Wing',
    genre: 'Nature',
    year: 2008,
    rating: 7.2,
    image: 'assets/posters/crimson_wing.jpeg',
  ),
  const Movie(
    title: 'African Cats',
    genre: 'Nature',
    year: 2011,
    rating: 7.6,
    image: 'assets/posters/african_cats.jpeg',
  ),
  const Movie(
    title: 'Oceans',
    genre: 'Nature',
    year: 2009,
    rating: 7.8,
    image: 'assets/posters/oceans.jpeg',
  ),
];
