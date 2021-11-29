class Product {
  String? name;
  String? price;
  String? fDate;
  String? lDate;
  String? note;
  String? status;
  String? rec;

  Product(
      {this.name,
      this.price,
      this.fDate,
      this.lDate,
      this.note,
      this.status,
      this.rec});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'].toString();
    fDate = json['fDate'].toString();
    lDate = json['lDate'].toString();
    note = json['note'];
    status = json['status'].toString();
    rec = json['rec'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['fDate'] = fDate;
    data['lDate'] = lDate;
    data['note'] = note;
    data['status'] = status;
    data['rec'] = rec;
    return data;
  }
}
