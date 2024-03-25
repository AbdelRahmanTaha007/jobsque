class PortfoliosPortofolioModel {
  int? id;
  String? cvFile;
  String? name;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  PortfoliosPortofolioModel(
      {this.id,
      this.cvFile,
      this.name,
      this.image,
      this.userId,
      this.createdAt,
      this.updatedAt});

  PortfoliosPortofolioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cvFile = json['cv_file'];
    name = json['name'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cv_file'] = this.cvFile;
    data['name'] = this.name;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
