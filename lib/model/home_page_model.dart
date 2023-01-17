class HomePageModel {
  String? sectionType;
  String? sectionTitle;
  String? sectionIcon;
  String? bgColor;
  int? order;
  List<Content>? content;

  HomePageModel(
      {this.sectionType,
        this.sectionTitle,
        this.sectionIcon,
        this.bgColor,
        this.order,
        this.content});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    sectionTitle = json['sectionTitle'];
    sectionIcon = json['sectionIcon'];
    bgColor = json['bgColor'];
    order = json['order'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionType'] = this.sectionType;
    data['sectionTitle'] = this.sectionTitle;
    data['sectionIcon'] = this.sectionIcon;
    data['bgColor'] = this.bgColor;
    data['order'] = this.order;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  int? id;
  String? title;
  String? imgUrl;

  Content({this.id, this.title, this.imgUrl});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}