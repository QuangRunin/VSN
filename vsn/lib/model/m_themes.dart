class MThemes{
  int id;
  double themeFontSize;
  dynamic appBarColor;
  dynamic appBarTextColor;
  dynamic titleColor;
  dynamic textColor;
  dynamic extraColor;
  dynamic scaffoldColor;
  dynamic iconTabColor;
  dynamic dividerColor;
  int indexTheme;

  MThemes(
      {this.id,
      this.themeFontSize,
      this.appBarColor,
      this.appBarTextColor,
      this.titleColor,
      this.textColor,
      this.extraColor,
      this.scaffoldColor,
      this.iconTabColor,
      this.dividerColor,
      this.indexTheme});

  MThemes.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    themeFontSize = double.parse(map['themeFontSize']);
    appBarColor = map['appBarColor'];
    appBarTextColor = map['appBarTextColor'];
    titleColor = map['titleColor'];
    textColor = map['textColor'];
    extraColor = map['extraColor'];
    scaffoldColor = map['scaffoldColor'];
    iconTabColor = map['iconTabColor'];
    dividerColor = map['dividerColor'];
    indexTheme = map["indexTheme"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'themeFontSize': themeFontSize,
      'appBarColor': appBarColor,
      'appBarTextColor': appBarTextColor,
      'titleColor': titleColor,
      'textColor': textColor,
      'extraColor': extraColor,
      'scaffoldColor': scaffoldColor,
      'iconTabColor': iconTabColor,
      'dividerColor': dividerColor,
      'indexTheme': indexTheme,
    };
    return map;
  }
}
