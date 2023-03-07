class DetailModelClass {
  DetailModelClass({
    List<Data>? data,
  }) {
    _data = data;
  }

  DetailModelClass.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  List<Data>? _data;

  DetailModelClass copyWith({
    List<Data>? data,
  }) =>
      DetailModelClass(
        data: data ?? _data,
      );

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    String? contentId,
    String? caption,
    String? thumbnail,
    String? url,
    int? views,
    int? likes,
    String? createdAt,
  }) {
    _contentId = contentId;
    _caption = caption;
    _thumbnail = thumbnail;
    _url = url;
    _views = views;
    _likes = likes;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _contentId = json['contentId'];
    _caption = json['caption'];
    _thumbnail = json['thumbnail'];
    _url = json['url'];
    _views = json['views'];
    _likes = json['likes'];
    _createdAt = json['createdAt'];
  }

  String? _contentId;
  String? _caption;
  String? _thumbnail;
  String? _url;
  int? _views;
  int? _likes;
  String? _createdAt;

  Data copyWith({
    String? contentId,
    String? caption,
    String? thumbnail,
    String? url,
    int? views,
    int? likes,
    String? createdAt,
  }) =>
      Data(
        contentId: contentId ?? _contentId,
        caption: caption ?? _caption,
        thumbnail: thumbnail ?? _thumbnail,
        url: url ?? _url,
        views: views ?? _views,
        likes: likes ?? _likes,
        createdAt: createdAt ?? _createdAt,
      );

  String? get contentId => _contentId;

  String? get caption => _caption;

  String? get thumbnail => _thumbnail;

  String? get url => _url;

  int? get views => _views;

  int? get likes => _likes;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contentId'] = _contentId;
    map['caption'] = _caption;
    map['thumbnail'] = _thumbnail;
    map['url'] = _url;
    map['views'] = _views;
    map['likes'] = _likes;
    map['createdAt'] = _createdAt;
    return map;
  }
}
