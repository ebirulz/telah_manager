class Debtors {
  int id;
  String type;
  String currency;
  double totalIssued;
  double totalOutstanding;
  double totalCredit;
  double totalPaid;
  double totalUpcoming;
  String lastUpdatedAt;
  String balanceUpdatedAt;
  Tenure? tenure;
  Project? project;

  Debtors({
    required this.id,
    required this.type,
    required this.currency,
    required this.totalIssued,
    required this.totalOutstanding,
    required this.totalCredit,
    required this.totalPaid,
    required this.totalUpcoming,
    required this.lastUpdatedAt,
    required this.balanceUpdatedAt,
    required this.tenure,
    required this.project,
  });

  factory Debtors.fromJson(Map<String, dynamic> json) => Debtors(
        id: json['id'],
        type: json['type'],
        currency: json['currency'],
        totalIssued: json['totalIssued'],
        totalOutstanding: json['totalOutstanding'],
        totalCredit: double.parse(json['totalCredit'].toString()),
        totalPaid: json['totalPaid'],
        totalUpcoming: double.parse(json['totalUpcoming'].toString()),
        lastUpdatedAt: json['lastUpdatedAt'],
        balanceUpdatedAt: json['balanceUpdatedAt'],
        tenure: json['tenure'] != null ? Tenure.fromJson(json['tenure']) : null,
        project:
            json['project'] != null ? Project.fromJson(json['project']) : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['currency'] = this.currency;
    data['totalIssued'] = this.totalIssued;
    data['totalOutstanding'] = this.totalOutstanding;
    data['totalCredit'] = this.totalCredit;
    data['totalPaid'] = this.totalPaid;
    data['totalUpcoming'] = this.totalUpcoming;
    data['lastUpdatedAt'] = this.lastUpdatedAt;
    data['balanceUpdatedAt'] = this.balanceUpdatedAt;
    if (this.tenure != null) {
      data['tenure'] = this.tenure!.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    return data;
  }
}

class Tenure {
  int id;
  List<PrimaryResidents> primaryResidents;
  PropertyUnit propertyUnit;
  String createdAt;

  Tenure(
      {required this.id,
      required this.primaryResidents,
      required this.propertyUnit,
      required this.createdAt});

  factory Tenure.fromJson(Map<String, dynamic> json) => Tenure(
        id: json['id'],
        /* if (json['primaryResidents'] != null) {
      primaryResidents = <PrimaryResidents>[];
      json['primaryResidents'].forEach((v) {
        primaryResidents.add(new PrimaryResidents.fromJson(v));
      });
    } */
        primaryResidents: json['primaryResidents'] != null
            ? List<PrimaryResidents>.from(json['primaryResidents']
                .map((x) => PrimaryResidents.fromJson(x)))
            : [],
        propertyUnit: (json['propertyUnit'] != null
            ? new PropertyUnit.fromJson(json['propertyUnit'])
            : null)!,
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.primaryResidents != null) {
      data['primaryResidents'] =
          this.primaryResidents.map((v) => v.toJson()).toList();
    }
    if (this.propertyUnit != null) {
      data['propertyUnit'] = this.propertyUnit.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class PrimaryResidents {
  int id;
  String displayName;
  bool isIndividual;
  String firstName;
  String lastName;
  String phoneNumber;
  String type;
  String? userId;

  PrimaryResidents(
      {required this.id,
      required this.displayName,
      required this.isIndividual,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.type,
      required this.userId});

  factory PrimaryResidents.fromJson(Map<String, dynamic> json) =>
      PrimaryResidents(
        id: json['id'],
        displayName: json['displayName'],
        isIndividual: json['isIndividual'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        type: json['type'],
        userId: json['userId'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['displayName'] = this.displayName;
    data['isIndividual'] = this.isIndividual;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['type'] = this.type;
    data['userId'] = this.userId;
    return data;
  }
}

class PropertyUnit {
  int id;
  String houseNumber;
  String streetName;
  Property? property;
  BillingGroup? billingGroup;

  PropertyUnit(
      {required this.id,
      required this.houseNumber,
      required this.streetName,
      required this.property,
      required this.billingGroup});

  factory PropertyUnit.fromJson(Map<String, dynamic> json) => PropertyUnit(
        id: json['id'],
        houseNumber: json['houseNumber'],
        streetName: json['streetName'],
        property: json['property'] != null
            ? new Property.fromJson(json['property'])
            : null,
        billingGroup: json['billingGroup'] != null
            ? new BillingGroup.fromJson(json['billingGroup'])
            : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['houseNumber'] = this.houseNumber;
    data['streetName'] = this.streetName;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    if (this.billingGroup != null) {
      data['billingGroup'] = this.billingGroup!.toJson();
    }
    return data;
  }
}

class Property {
  int id;
  String label;
  String type;
  Address? address;
  String workspaceId;

  Property(
      {required this.id,
      required this.label,
      required this.type,
      required this.address,
      required this.workspaceId});

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json['id'],
        label: json['label'],
        type: json['type'],
        address:
            json['address'] != null ? Address.fromJson(json['address']) : null,
        workspaceId: json['workspaceId'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['type'] = this.type;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['workspaceId'] = this.workspaceId;
    return data;
  }
}

class Address {
  City? city;
  String? district;

  Address({required this.city, required this.district});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json['city'] != null ? City.fromJson(json['city']) : null,
        district: json['district'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['district'] = this.district;
    return data;
  }
}

class City {
  String name;
  String code;
  Country? country;

  City({required this.name, required this.code, required this.country});

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json['name'],
        code: json['code'],
        country:
            json['country'] != null ? Country.fromJson(json['country']) : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  String name;
  String code;

  Country({required this.name, required this.code});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'],
        code: json['code'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class BillingGroup {
  int id;
  String name;
  String createdAt;

  BillingGroup({required this.id, required this.name, required this.createdAt});

  factory BillingGroup.fromJson(Map<String, dynamic> json) => BillingGroup(
        id: json['id'],
        name: json['name'],
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Project {
  Project(
      {required this.id,
      required this.name,
      required this.description,
      required this.billingType,
      required this.workspaceId});

  int id;
  String name;
  String? description;
  String billingType;
  String workspaceId;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        billingType: json['billingType'],
        workspaceId: json['workspaceId'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['billingType'] = this.billingType;
    data['workspaceId'] = this.workspaceId;
    return data;
  }
}
