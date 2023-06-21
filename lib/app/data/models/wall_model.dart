class WallModel {
  String path;
  String thumbUrl;
  bool isNew;
  WallModel({required this.path, required this.thumbUrl, required this.isNew});

  factory WallModel.fromJson(json) {
    const String _url =
        "https://raw.githubusercontent.com/Fusion-OS/FuseWalls/twelve/assets/walls/";
    return WallModel(
      path: _url + json['original'],
      thumbUrl: _url + json['compressed'],
      isNew: json['isNew'],
    );
  }
}
