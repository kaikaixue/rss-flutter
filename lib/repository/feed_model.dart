/// createBy : null
/// createTime : null
/// updateBy : null
/// updateTime : null
/// remark : null
/// feedId : null
/// feedUrl : "https://anotherdayu.com"
/// feedTitle : "Another Dayu"
/// feedDescription : "\"Seize the day, gather ye rosebuds while ye may.\""
/// feedLogo : "https://anotherdayu.com/wp-content/uploads/2022/06/cropped-photo_2022-06-16-10.08.51-32x32.jpeg"
/// createdAt : null
/// updatedAt : null
/// isRecommended : null

class FeedModel {
  FeedModel({
      this.createBy, 
      this.createTime, 
      this.updateBy, 
      this.updateTime, 
      this.remark, 
      this.feedId, 
      this.feedUrl, 
      this.feedTitle, 
      this.feedDescription, 
      this.feedLogo, 
      this.createdAt, 
      this.updatedAt, 
      this.isRecommended,});

  FeedModel.fromJson(dynamic json) {
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    feedId = json['feedId'];
    feedUrl = json['feedUrl'];
    feedTitle = json['feedTitle'];
    feedDescription = json['feedDescription'];
    feedLogo = json['feedLogo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isRecommended = json['isRecommended'];
  }
  dynamic createBy;
  dynamic createTime;
  dynamic updateBy;
  dynamic updateTime;
  dynamic remark;
  dynamic feedId;
  String? feedUrl;
  String? feedTitle;
  String? feedDescription;
  String? feedLogo;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic isRecommended;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createBy'] = createBy;
    map['createTime'] = createTime;
    map['updateBy'] = updateBy;
    map['updateTime'] = updateTime;
    map['remark'] = remark;
    map['feedId'] = feedId;
    map['feedUrl'] = feedUrl;
    map['feedTitle'] = feedTitle;
    map['feedDescription'] = feedDescription;
    map['feedLogo'] = feedLogo;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['isRecommended'] = isRecommended;
    return map;
  }

}