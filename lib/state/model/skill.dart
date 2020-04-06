class Skill {
  String name;
  int rating;
  String imageUrl;
  bool primary;

  Skill({this.name, this.rating = 0, this.imageUrl = '', this.primary = false})
      : assert(rating <= 10 && rating >= 0);

  factory Skill.fromMap(Map data) {
    return Skill(
      name: data['name'],
      rating: data['rating'],
      imageUrl: data['imageUrl'],
      primary: data['primary'],
    );
  }
}
