class NotificationModel {
  String? to;
  Notification? notification;
  Data? data;

  NotificationModel({this.to, this.notification, this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to'] = to;
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Notification {
  String? title;
  String? body;
  bool? mutableContent=true;
  String? sound='Tri-tone';

  Notification({this.title, this.body, this.mutableContent, this.sound});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['mutable_content'] = mutableContent;
    data['sound'] = sound;
    return data;
  }
}

class Data {
  String? url='';
  String? dl='';

  Data({this.url, this.dl});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['dl'] = dl;
    return data;
  }
}
