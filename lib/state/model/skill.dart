class Skill {
  String name;
  int rating;
  String imageUrl;

  Skill({this.name, this.rating = 0, this.imageUrl = ''})
      : assert(rating <= 10 && rating >= 0);
}
