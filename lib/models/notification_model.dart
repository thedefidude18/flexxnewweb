class NotificationModel {
  final String userId;
  final String? senderName; // Added this field
  final String body;
  final String? userImage;
  final String? currentUserImage;
  final String type;
  final dynamic creationDate;
  final String title;
  final String amount;
  final String selectedOption;
  final String eventId;

  NotificationModel({
    required this.userId,
    this.senderName, // Initialize this field
    required this.body,
     this.userImage,
     this.currentUserImage,
    required this.type,
    required this.creationDate,
    required this.title,
    required this.amount,
    required this.selectedOption,
    required this.eventId
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        userId: json['id'],
        senderName: json['senderName'] ?? '', // Parse this field
        body: json['body'],
        userImage: json['userImage'],
        currentUserImage: json['currentUserImage'],
        type: json['type'],
        creationDate: json['creationDate'],
        title: json['title'],
        amount: json['eventAmount'] ?? '',
        selectedOption: json['selectedOption'] ?? '',
        eventId: json['eventId'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'senderName': senderName, // Serialize this field
      'body': body,
      'userImage': userImage,
      'currentUserImage': currentUserImage,
      'type': type,
      'creationDate': creationDate,
      'title': title,
      'eventAmount': amount,
      'selectedOption': selectedOption,
      'eventId': eventId,
    };
  }
}
