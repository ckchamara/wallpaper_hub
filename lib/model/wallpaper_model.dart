class WallpaperModel {
  String photographer;
  String photographer_url;
  int photographer_id;
  srcModel src;

  WallpaperModel({required this.photographer, required this.photographer_url, required this.photographer_id,
      required this.src});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        src: srcModel.fromMap(jsonData["src"]),
        photographer: jsonData["photographer"],
        photographer_url: jsonData["photographer_url"],
        photographer_id: jsonData["photographer_id"],
    );
  }


}

class srcModel {
  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  srcModel({ required this.original, required this.large2x, required this.large, required this.medium, required this.small,
      required this.portrait, required this.landscape, required this.tiny});

  factory srcModel.fromMap(Map<String,dynamic> jsonData) {
      return srcModel(
          original: jsonData["original"] ,
          large2x: jsonData["large2x"],
          large: jsonData["large"],
          medium: jsonData["medium"],
          small: jsonData["small"],
          portrait: jsonData["portrait"],
          landscape: jsonData["landscape"],
          tiny: jsonData["tiny"]
      );
  }

}
