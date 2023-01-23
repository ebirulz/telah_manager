class WalletModel {
  String walletId;
  String currency;
  double balance;
  double credit;
  String type;
  String workspaceId;

  WalletModel({
    required this.walletId,
    required this.currency,
    required this.balance,
    required this.credit,
    required this.type,
    required this.workspaceId,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
      walletId: json['walletId'],
      currency: json['currency'],
      balance: json['balance'],
      credit: json['credit'],
      type: json['type'],
      workspaceId: json['workspaceId']);

  Map<String, dynamic> toJson() => {
        "walletId": walletId,
        "currency": currency,
        "balance": balance,
        "credit": credit,
        "type": type,
        "workspaceId": workspaceId,
      };
}
