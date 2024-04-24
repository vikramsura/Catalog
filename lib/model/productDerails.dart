class ProductDerails {
  bool? success;
  int? status;
  String? message;
  ProductDerailsData? data;

  ProductDerails({this.success, this.status, this.message, this.data});

  ProductDerails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? ProductDerailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductDerailsData {
  int? id;
  String? sellerUniId;
  String? productsUniId;
  String? name;
  String? mainCategory;
  String? category;
  String? subCategory;
  int? moq;
  int? status;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  int? metal;
  String? metalType;
  String? metalColor;
  var metalHeight;
  var metalWidth;
  var metalWeight;
  int? metalPrice;
  String? stoneGroup;
  String? stoneName;
  String? stoneShape;
  String? stoneQuality;
  var stoneSize;
  int? stonePcs;
  var stoneWeight;
  int? stonePrice;
  String? stoneCtype;
  String? stoneCno;
  int? productPrice;
  bool? customize;
  bool? isRing;
  List<RingSize>? ringSize;
  List<ProductImage>? productImage;

  ProductDerailsData(
      {this.id,
      this.sellerUniId,
      this.productsUniId,
      this.name,
      this.mainCategory,
      this.category,
      this.subCategory,
      this.moq,
      this.status,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.metal,
      this.metalType,
      this.metalColor,
      this.metalHeight,
      this.metalWidth,
      this.metalWeight,
      this.metalPrice,
      this.stoneGroup,
      this.stoneName,
      this.stoneShape,
      this.stoneQuality,
      this.stoneSize,
      this.stonePcs,
      this.stoneWeight,
      this.stonePrice,
      this.stoneCtype,
      this.stoneCno,
      this.productPrice,
      this.customize,
      this.isRing,
      this.ringSize,
      this.productImage});

  ProductDerailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerUniId = json['seller_uni_id'];
    productsUniId = json['products_uni_id'];
    name = json['name'];
    mainCategory = json['main_category'];
    category = json['category'];
    subCategory = json['sub_category'];
    moq = json['moq'];
    status = json['status'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    metal = json['metal'];
    metalType = json['metal_type'];
    metalColor = json['metal_color'];
    metalHeight = json['metal_height'];
    metalWidth = json['metal_width'];
    metalWeight = json['metal_weight'];
    metalPrice = json['metal_price'];
    stoneGroup = json['stone_group'];
    stoneName = json['stone_name'];
    stoneShape = json['stone_shape'];
    stoneQuality = json['stone_quality'];
    stoneSize = json['stone_size'];
    stonePcs = json['stone_pcs'];
    stoneWeight = json['stone_weight'];
    stonePrice = json['stone_price'];
    stoneCtype = json['stone_ctype'];
    stoneCno = json['stone_cno'];
    productPrice = json['product_price'];
    customize = json['customize'];
    isRing = json['is_ring'];
    if (json['ringSize'] != null) {
      ringSize = <RingSize>[];
      json['ringSize'].forEach((v) {
        ringSize!.add(RingSize.fromJson(v));
      });
    }
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_uni_id'] = this.sellerUniId;
    data['products_uni_id'] = this.productsUniId;
    data['name'] = this.name;
    data['main_category'] = this.mainCategory;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['moq'] = this.moq;
    data['status'] = this.status;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['metal'] = this.metal;
    data['metal_type'] = this.metalType;
    data['metal_color'] = this.metalColor;
    data['metal_height'] = this.metalHeight;
    data['metal_width'] = this.metalWidth;
    data['metal_weight'] = this.metalWeight;
    data['metal_price'] = this.metalPrice;
    data['stone_group'] = this.stoneGroup;
    data['stone_name'] = this.stoneName;
    data['stone_shape'] = this.stoneShape;
    data['stone_quality'] = this.stoneQuality;
    data['stone_size'] = this.stoneSize;
    data['stone_pcs'] = this.stonePcs;
    data['stone_weight'] = this.stoneWeight;
    data['stone_price'] = this.stonePrice;
    data['stone_ctype'] = this.stoneCtype;
    data['stone_cno'] = this.stoneCno;
    data['product_price'] = this.productPrice;
    data['customize'] = this.customize;
    data['is_ring'] = this.isRing;
    if (this.ringSize != null) {
      data['ringSize'] = this.ringSize!.map((v) => v.toJson()).toList();
    }
    if (this.productImage != null) {
      data['product_image'] =
          this.productImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RingSize {
  var size;
  var id;

  RingSize({this.size, this.id});

  RingSize.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['id'] = this.id;
    return data;
  }
}

class ProductImage {
  int? id;
  String? sellerUniId;
  String? productsUniId;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProductImage(
      {this.id,
      this.sellerUniId,
      this.productsUniId,
      this.image,
      this.createdAt,
      this.updatedAt});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerUniId = json['seller_uni_id'];
    productsUniId = json['products_uni_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_uni_id'] = this.sellerUniId;
    data['products_uni_id'] = this.productsUniId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
