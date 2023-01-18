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
  String? slug;
  String? icon;
  String? inner;
  String? shopName;
  String? logo;
  String? slogan;
  String? backgroundImage;
  String? imageUrl;
  String? discountText;

  Content({this.id, this.title, this.imgUrl,this.icon,this.inner,this.imageUrl,
    this.slug,this.backgroundImage,this.logo,this.shopName,this.slogan,this.discountText});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgUrl = json['imgUrl'];
    icon=json['icon'];
    inner=json['inner'];
    slug=json['slug'];
    backgroundImage=json['backgroundImage'];
    logo=json['logo'];
    shopName=json['shopName'];
    slogan=json['slogan'];
    imageUrl=json['imageUrl'];
    discountText=json['discountText'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imgUrl'] = this.imgUrl;
    data['icon'] = this.icon;
    data['inner'] = this.inner;
    data['slug'] = this.slug;
    data['backgroundImage'] = this.backgroundImage;
    data['logo'] = this.logo;
    data['shopName'] = this.shopName;
    data['slogan'] = this.slogan;
    data['imageUrl'] = this.imageUrl;
    data['discountText'] = this.discountText;

    return data;
  }
}
//
// class HomePageModel {
//   HomePageModel({
//     this.sectionType,
//     this.sectionTitle,
//     this.sectionIcon,
//     this.bgColor,
//     this.order,
//     this.content,
//   });
//
//   String? sectionType;
//   String? sectionTitle;
//   String ?sectionIcon;
//   String ?bgColor;
//   int ?order;
//   dynamic content;
// }
//
// class Content {
//   Content({
//     this.id,
//     this.title,
//     this.imgUrl,
//     this.slug,
//     this.icon,
//     this.inner,
//     this.shopName,
//     this.logo,
//     this.slogan,
//     this.backgroundImage,
//     this.homepageSectionId,
//     this.vendorId,
//     this.imageUrl,
//     this.rating,
//     this.reviews,
//     this.brandId,
//     this.categoryId,
//     this.discountPrice,
//     this.discountText,
//   });
//
//   int? id;//
//   String? title;//
//   String? imgUrl;//
//   String? slug;//
//   String? icon;//
//   String? inner;//
//   String ?shopName;
//   String ?logo;
//   String ?slogan;
//   String ?backgroundImage;
//   String ?homepageSectionId;
//   String ?vendorId;
//   String ?imageUrl;
//   String ?rating;
//   String ?reviews;
//   String ?brandId;
//   String ?categoryId;
//   String ?discountPrice;
//   String ?discountText;
//
//   Content.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     imgUrl = json['imgUrl'];
//     icon=json['icon'];
//     slug=json['slug'];
//     inner=json['inner'];
//     shopName=json['shopName'];
//     logo=json['logo'];
//     slogan=json['slogan'];
//     backgroundImage=json['backgroundImage'];
//     homepageSectionId=json['homepageSectionId'];
//     vendorId=json['vendorId'];
//     imageUrl=json['imageUrl'];
//     rating=json['rating'];
//     reviews=json['reviews'];
//     brandId=json['brandId'];
//     categoryId=json['categoryId'];
//     discountPrice=json['discountPrice'];
//     discountText=json['discountText'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['imgUrl'] = this.imgUrl;
//     data['icon'] = this.icon;
//     data['inner'] = this.inner;
//     data['slug'] = this.slug;
//     data['shopName'] = this.shopName;
//     data['logo'] = this.logo;
//     data['slogan'] = this.slogan;
//     data['backgroundImage'] = this.backgroundImage;
//     data['homepageSectionId'] = this.homepageSectionId;
//     data['vendorId'] = this.vendorId;
//     data['rating'] = this.rating;
//     data['reviews'] = this.reviews;
//     data['brandId'] = this.brandId;
//     data['categoryId'] = this.categoryId;
//     data['discountPrice'] = this.discountPrice;
//     data['discountText'] = this.discountText;
//     data['imageUrl'] = this.imageUrl;
//     return data;
//   }
// }
//
// class PurpleContent {
//   PurpleContent({
//     this.id,
//     this.logo,
//     this.email,
//     this.phone,
//     this.systemName,
//     this.title,
//     this.copyright,
//     this.address,
//     this.language,
//     this.timeZone,
//     this.footerText,
//     this.slogan,
//     this.facebook,
//     this.twitter,
//     this.youtube,
//     this.instagram,
//     this.linkedIn,
//   });
//
//   int ?id;
//   String? logo;
//   String? email;
//   String? phone;
//   String ?systemName;
//   String ?title;
//   String ?copyright;
//   String ?address;
//   String ?language;
//   String ?timeZone;
//   String ?footerText;
//   String ?slogan;
//   String ?facebook;
//   String ?twitter;
//   String ?youtube;
//   String ?instagram;
//   String ?linkedIn;
// }
