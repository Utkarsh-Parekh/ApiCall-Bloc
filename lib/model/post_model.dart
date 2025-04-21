import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<Datum> data;
  final Support support;

  UserModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  UserModel copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<Datum>? data,
    Support? support,
  }) =>
      UserModel(
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
        total: total ?? this.total,
        totalPages: totalPages ?? this.totalPages,
        data: data ?? this.data,
        support: support ?? this.support,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    support: Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "support": support.toJson(),
  };
}

class Datum {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  Datum({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  Datum copyWith({
    int? id,
    String? name,
    int? year,
    String? color,
    String? pantoneValue,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        year: year ?? this.year,
        color: color ?? this.color,
        pantoneValue: pantoneValue ?? this.pantoneValue,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    year: json["year"],
    color: json["color"],
    pantoneValue: json["pantone_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "year": year,
    "color": color,
    "pantone_value": pantoneValue,
  };
}

class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  Support copyWith({
    String? url,
    String? text,
  }) =>
      Support(
        url: url ?? this.url,
        text: text ?? this.text,
      );

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}
