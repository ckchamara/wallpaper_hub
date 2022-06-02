class WallpaperModel {
  String photographer;
  String photographer_url;
  int photographer_id;
  String avg_color;
  srcModel src;

  WallpaperModel(this.photographer, this.photographer_url, this.photographer_id,
      this.avg_color, this.src);

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

  srcModel(this.original, this.large2x, this.large, this.medium, this.small,
      this.portrait, this.landscape, this.tiny);


}
