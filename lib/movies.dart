class Movie {
  final String title;
  final int year;
  final String posterUrl;
  final String time;
  final String type;

  Movie({
    required this.title,
    required this.year,
    required this.posterUrl,
    required this.time,
    required this.type,
  });
}

final List<Movie> moviesList = [
  Movie(
    title: "Chhaava",
    year: 2025,
    posterUrl:
        "https://m.media-amazon.com/images/I/61-lNA-rD5L._AC_UF894%2C1000_QL80_.jpg",
    time: "2h 28m",
    type: "Historical,Action",
  ),
  Movie(
    title: "Jewel Thief – The Heist Begins",
    year: 2025,
    posterUrl:
        "https://m.media-amazon.com/images/M/MV5BOWM5ZGVkNjItZDg0MC00YjIwLTkyNjEtYjdlMGM2Mjc4ODFmXkEyXkFqcGc%40._V1_FMjpg_UX1000_.jpg",
    time: "2h 10m",
    type: "Heist,Thriller",
  ),
  Movie(
    title: "Kaalidhar Laapata",
    year: 2025,
    posterUrl:
        "https://m.media-amazon.com/images/M/MV5BZDRhMmY1NmMtZGI3Ni00ODhjLWE0MzctYTNiOGY3ZjkyMTczXkEyXkFqcGc%40._V1_.jpg",
    time: "2h 05m",
    type: "Mystery,Drama",
  ),
  Movie(
    title: "Ek Deewane Ki Deewaniyat",
    year: 2025,
    posterUrl:
        "https://m.media-amazon.com/images/M/MV5BMDViZjlhMmYtNGQ3OC00YjUxLTg4OTAtZDMwMDlmYzI1N2VhXkEyXkFqcGc%40._V1_FMjpg_UX1000_.jpg",
    time: "2h 20m",
    type: "Romantic,Drama",
  ),
  Movie(
    title: "Housefull 5",
    year: 2025,
    posterUrl:
        "https://m.media-amazon.com/images/M/MV5BZmIzMThjNTYtNjkwZi00NmM3LTliNGItZWIxYTUwMGU1YzM0XkEyXkFqcGc%40._V1_FMjpg_UX1000_.jpg",
    time: "2h 18m",
    type: "Comedy",
  ),
  Movie(
    title: "Raid 2",
    year: 2025,
    posterUrl:
        "https://m.media-amazon.com/images/M/MV5BNjQyOTRiYTQtNzU0MS00ZGM2LWE4MTktODI5ZjZiN2NkYjYyXkEyXkFqcGc%40._V1_.jpg",
    time: "2h 32m",
    type: "Crime,Thriller",
  ),
  Movie(
    title: "Badass Ravi Kumar",
    year: 2025,
    posterUrl:
        "https://m.media-amazon.com/images/M/MV5BZGE3OTlkMDMtZTBmYy00M2RjLTlhYjgtYzhjNGUzM2MxNzY0XkEyXkFqcGc%40._V1_.jpg",
    time: "2h 14m",
    type: "Action",
  ),
];
