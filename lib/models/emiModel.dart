
class EmiData {

  String month;
  String principal;
  String interest;
  String balance;

  EmiData({this.month, this.principal, this.interest, this.balance});

  EmiData.fromMap(Map element) :
    month = element['month'] ?? '',
    principal = element['principal'] ?? '',
    interest = element['interest'] ?? '',
    balance = element['balance'] ?? '';

  toJson() {
    return {
      "month": month,
      "principal": principal,
      "interest": interest,
      "balance": balance,
    };
  }
}