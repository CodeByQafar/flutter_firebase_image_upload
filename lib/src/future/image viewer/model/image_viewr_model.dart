class ImageViewerResponse  {
  List<Items>? items;

  ImageViewerResponse ({this.items});

  ImageViewerResponse .fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? name;
  String? bucket;

  Items({this.name, this.bucket});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bucket = json['bucket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] =name;
    data['bucket'] = bucket;
    return data;
  }
}