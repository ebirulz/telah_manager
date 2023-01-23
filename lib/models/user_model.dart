class UserModel {
  UserModel({
    required this.name,
    required this.userId,
    required this.email,
    required this.workspaceModel,
    required this.roles,
    required this.otherEmails,
    required this.createdAt,
    required this.acceptedAt,
  });

  String name;
  String userId;
  String email;
  WorkspaceModel workspaceModel;
  List roles;
  List otherEmails;
  DateTime createdAt;
  DateTime? acceptedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] ?? '',
        userId: json["userId"] ?? '',
        email: json["email"],
        workspaceModel: WorkspaceModel.fromJson(json['workspace']),
        roles: List.from(json["roles"].map((x) => x)),
        otherEmails: List.from(json["otherEmails"].map((x) => x)),
        createdAt: DateTime.parse(json['createdAt']),
        acceptedAt: json['acceptedAt'] != null
            ? DateTime.parse(json['acceptedAt'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "userId": userId,
        "email": email,
        "workspace": workspaceModel,
        "roles": roles,
        "otherEmails": otherEmails,
        "createdAt": createdAt,
        "acceptedAt": acceptedAt,
      };
}

class WorkspaceModel {
  String name;
  String workspaceId;
  List roles;
  String createdBy;

  WorkspaceModel({
    required this.name,
    required this.workspaceId,
    required this.roles,
    required this.createdBy,
  });

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) => WorkspaceModel(
      name: json['name'],
      workspaceId: json['workspaceId'],
      roles: List.from(json['roles'].map((x) => x)),
      createdBy: json['createdBy']);
}
