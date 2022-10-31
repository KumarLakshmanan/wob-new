class StoreDetails {
  StoreDetails({
    required this.id,
    required this.name,
    required this.address,
    required this.latlng,
    required this.uuid,
    required this.mac,
  });
  late final String id;
  late final String name;
  late final String address;
  late final String latlng;
  late final String uuid;
  late final String mac;
  
  StoreDetails.fromJson(Map<String, dynamic> json, String _id){
    id = _id;
    name = json['name'];
    address = json['address'];
    latlng = json['latlng'].replaceAll(' ', '');
    uuid = json['uuid'];
    mac = json['mac'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['address'] = address;
    _data['latlng'] = latlng;
    _data['uuid'] = uuid;
    _data['mac'] = mac;
    return _data;
  }
}