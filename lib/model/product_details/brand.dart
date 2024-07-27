class Brand1 {
  String? id;
  String? name;
  String? slug;
  String? image;
  int? v;

  Brand1({this.id, this.name, this.slug, this.image, this.v});

  factory Brand1.fromJson(Map<String, dynamic> json) => Brand1(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'image': image,
        '__v': v,
      };
}
