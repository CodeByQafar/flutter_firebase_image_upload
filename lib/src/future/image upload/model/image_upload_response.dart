class ImageUploadResponse {
  String? name;
  String? bucket;
  String? generation;
  String? metageneration;
  String? timeCreated;
  String? updated;
  String? storageClass;
  String? size;
  String? md5Hash;
  String? contentEncoding;
  String? contentDisposition;
  String? crc32c;
  String? etag;
  String? downloadTokens;

  ImageUploadResponse(
      {this.name,
      this.bucket,
      this.generation,
      this.metageneration,
      this.timeCreated,
      this.updated,
      this.storageClass,
      this.size,
      this.md5Hash,
      this.contentEncoding,
      this.contentDisposition,
      this.crc32c,
      this.etag,
      this.downloadTokens});

  ImageUploadResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bucket = json['bucket'];
    generation = json['generation'];
    metageneration = json['metageneration'];
    timeCreated = json['timeCreated'];
    updated = json['updated'];
    storageClass = json['storageClass'];
    size = json['size'];
    md5Hash = json['md5Hash'];
    contentEncoding = json['contentEncoding'];
    contentDisposition = json['contentDisposition'];
    crc32c = json['crc32c'];
    etag = json['etag'];
    downloadTokens = json['downloadTokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['bucket'] = bucket;
    data['generation'] = generation;
    data['metageneration'] = metageneration;
    data['timeCreated'] = timeCreated;
    data['updated'] = updated;
    data['storageClass'] = storageClass;
    data['size'] = size;
    data['md5Hash'] = md5Hash;
    data['contentEncoding'] = contentEncoding;
    data['contentDisposition'] = contentDisposition;
    data['crc32c'] = crc32c;
    data['etag'] = etag;
    data['downloadTokens'] = downloadTokens;
    return data;
  }
}