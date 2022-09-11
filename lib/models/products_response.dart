// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromMap(jsonString);

import 'dart:convert';

import 'package:app_cart_woocomerce/models/models.dart';

class ProductModel {
  int id;
  String name;
  String description;
  String price;
  List<Image> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
    );
  }
}

// class ProductsResponse {
//   ProductsResponse({
//     this.id,
//     required this.name,
//     required this.slug,
//     required this.permalink,
//     required this.dateCreated,
//     required this.dateCreatedGmt,
//     required this.dateModified,
//     required this.dateModifiedGmt,
//     required this.type,
//     required this.status,
//     required this.featured,
//     required this.catalogVisibility,
//     required this.description,
//     required this.shortDescription,
//     required this.sku,
//     required this.price,
//     required this.regularPrice,
//     required this.salePrice,
//     this.dateOnSaleFrom,
//     this.dateOnSaleFromGmt,
//     this.dateOnSaleTo,
//     this.dateOnSaleToGmt,
//     required this.onSale,
//     required this.purchasable,
//     required this.totalSales,
//     required this.virtual,
//     required this.downloadable,
//     required this.downloads,
//     required this.downloadLimit,
//     required this.downloadExpiry,
//     required this.externalUrl,
//     required this.buttonText,
//     required this.taxStatus,
//     required this.taxClass,
//     required this.manageStock,
//     this.stockQuantity,
//     this.backorders,
//     required this.backordersAllowed,
//     required this.backordered,
//     this.lowStockAmount,
//     required this.soldIndividually,
//     required this.weight,
//     required this.dimensions,
//     required this.shippingRequired,
//     required this.shippingTaxable,
//     required this.shippingClass,
//     required this.shippingClassId,
//     required this.reviewsAllowed,
//     required this.averageRating,
//     required this.ratingCount,
//     required this.upsellIds,
//     required this.crossSellIds,
//     required this.parentId,
//     required this.purchaseNote,
//     required this.categories,
//     required this.tags,
//     required this.images,
//     required this.attributes,
//     required this.defaultAttributes,
//     required this.variations,
//     required this.groupedProducts,
//     required this.menuOrder,
//     required this.priceHtml,
//     required this.relatedIds,
//     // required this.metaData,
//     required this.stockStatus,
//     required this.hasOptions,
//     required this.links,
//   });

//   int? id;
//   String name;
//   String slug;
//   String permalink;
//   DateTime dateCreated;
//   DateTime dateCreatedGmt;
//   DateTime dateModified;
//   DateTime dateModifiedGmt;
//   String type;
//   String status;
//   bool featured;
//   String catalogVisibility;
//   String description;
//   String shortDescription;
//   String sku;
//   String price;
//   String regularPrice;
//   String salePrice;
//   dynamic dateOnSaleFrom;
//   dynamic dateOnSaleFromGmt;
//   dynamic dateOnSaleTo;
//   dynamic dateOnSaleToGmt;
//   bool onSale;
//   bool purchasable;
//   int totalSales;
//   bool virtual;
//   bool downloadable;
//   List<dynamic> downloads;
//   int downloadLimit;
//   int downloadExpiry;
//   String externalUrl;
//   String buttonText;
//   String taxStatus;
//   String taxClass;
//   bool manageStock;
//   dynamic stockQuantity;
//   Backorders? backorders;
//   bool backordersAllowed;
//   bool backordered;
//   dynamic lowStockAmount;
//   bool soldIndividually;
//   String weight;
//   Dimensions dimensions;
//   bool shippingRequired;
//   bool shippingTaxable;
//   String shippingClass;
//   int shippingClassId;
//   bool reviewsAllowed;
//   String averageRating;
//   int ratingCount;
//   List<dynamic> upsellIds;
//   List<dynamic> crossSellIds;
//   int parentId;
//   String purchaseNote;
//   List<Category> categories;
//   List<dynamic> tags;
//   List<Image> images;
//   List<dynamic> attributes;
//   List<dynamic> defaultAttributes;
//   List<dynamic> variations;
//   List<dynamic> groupedProducts;
//   int menuOrder;
//   String priceHtml;
//   List<int> relatedIds;
//   // List<MetaDatum> metaData;
//   String stockStatus;
//   bool hasOptions;
//   Links links;

//   factory ProductsResponse.fromJson(String str) =>
//       ProductsResponse.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory ProductsResponse.fromMap(Map<String, dynamic> json) =>
//       ProductsResponse(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         permalink: json["permalink"],
//         dateCreated: DateTime.parse(json["date_created"]),
//         dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
//         dateModified: DateTime.parse(json["date_modified"]),
//         dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
//         type: json["type"],
//         status: json["status"],
//         featured: json["featured"],
//         catalogVisibility: json["catalog_visibility"],
//         description: json["description"],
//         shortDescription: json["short_description"],
//         sku: json["sku"],
//         price: json["price"],
//         regularPrice: json["regular_price"],
//         salePrice: json["sale_price"],
//         dateOnSaleFrom: json["date_on_sale_from"],
//         dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
//         dateOnSaleTo: json["date_on_sale_to"],
//         dateOnSaleToGmt: json["date_on_sale_to_gmt"],
//         onSale: json["on_sale"],
//         purchasable: json["purchasable"],
//         totalSales: json["total_sales"],
//         virtual: json["virtual"],
//         downloadable: json["downloadable"],
//         downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
//         downloadLimit: json["download_limit"],
//         downloadExpiry: json["download_expiry"],
//         externalUrl: json["external_url"],
//         buttonText: json["button_text"],
//         taxStatus: json["tax_status"],
//         taxClass: json["tax_class"],
//         manageStock: json["manage_stock"],
//         stockQuantity: json["stock_quantity"],
//         // backorders: backordersValues.map[json["backorders"]],
//         backordersAllowed: json["backorders_allowed"],
//         backordered: json["backordered"],
//         lowStockAmount: json["low_stock_amount"],
//         soldIndividually: json["sold_individually"],
//         weight: json["weight"],
//         dimensions: Dimensions.fromMap(json["dimensions"]),
//         shippingRequired: json["shipping_required"],
//         shippingTaxable: json["shipping_taxable"],
//         shippingClass: json["shipping_class"],
//         shippingClassId: json["shipping_class_id"],
//         reviewsAllowed: json["reviews_allowed"],
//         averageRating: json["average_rating"],
//         ratingCount: json["rating_count"],
//         upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
//         crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
//         parentId: json["parent_id"],
//         purchaseNote: json["purchase_note"],
//         categories: List<Category>.from(
//             json["categories"].map((x) => Category.fromMap(x))),
//         tags: List<dynamic>.from(json["tags"].map((x) => x)),
//         images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
//         attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
//         defaultAttributes:
//             List<dynamic>.from(json["default_attributes"].map((x) => x)),
//         variations: List<dynamic>.from(json["variations"].map((x) => x)),
//         groupedProducts:
//             List<dynamic>.from(json["grouped_products"].map((x) => x)),
//         menuOrder: json["menu_order"],
//         priceHtml: json["price_html"],
//         relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
//         // metaData: List<MetaDatum>.from(
//         //     json["meta_data"].map((x) => MetaDatum.fromMap(x))),
//         stockStatus: json["stock_status"],
//         hasOptions: json["has_options"],
//         links: Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "permalink": permalink,
//         "date_created": dateCreated.toIso8601String(),
//         "date_created_gmt": dateCreatedGmt.toIso8601String(),
//         "date_modified": dateModified.toIso8601String(),
//         "date_modified_gmt": dateModifiedGmt.toIso8601String(),
//         "type": type,
//         "status": status,
//         "featured": featured,
//         "catalog_visibility": catalogVisibility,
//         "description": description,
//         "short_description": shortDescription,
//         "sku": sku,
//         "price": price,
//         "regular_price": regularPrice,
//         "sale_price": salePrice,
//         "date_on_sale_from": dateOnSaleFrom,
//         "date_on_sale_from_gmt": dateOnSaleFromGmt,
//         "date_on_sale_to": dateOnSaleTo,
//         "date_on_sale_to_gmt": dateOnSaleToGmt,
//         "on_sale": onSale,
//         "purchasable": purchasable,
//         "total_sales": totalSales,
//         "virtual": virtual,
//         "downloadable": downloadable,
//         "downloads": List<dynamic>.from(downloads.map((x) => x)),
//         "download_limit": downloadLimit,
//         "download_expiry": downloadExpiry,
//         "external_url": externalUrl,
//         "button_text": buttonText,
//         "tax_status": taxStatus,
//         "tax_class": taxClass,
//         "manage_stock": manageStock,
//         "stock_quantity": stockQuantity,
//         // "backorders": backordersValues.reverse[backorders],
//         "backorders_allowed": backordersAllowed,
//         "backordered": backordered,
//         "low_stock_amount": lowStockAmount,
//         "sold_individually": soldIndividually,
//         "weight": weight,
//         "dimensions": dimensions.toMap(),
//         "shipping_required": shippingRequired,
//         "shipping_taxable": shippingTaxable,
//         "shipping_class": shippingClass,
//         "shipping_class_id": shippingClassId,
//         "reviews_allowed": reviewsAllowed,
//         "average_rating": averageRating,
//         "rating_count": ratingCount,
//         "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
//         "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
//         "parent_id": parentId,
//         "purchase_note": purchaseNote,
//         "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
//         "tags": List<dynamic>.from(tags.map((x) => x)),
//         "images": List<dynamic>.from(images.map((x) => x.toMap())),
//         "attributes": List<dynamic>.from(attributes.map((x) => x)),
//         "default_attributes":
//             List<dynamic>.from(defaultAttributes.map((x) => x)),
//         "variations": List<dynamic>.from(variations.map((x) => x)),
//         "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
//         "menu_order": menuOrder,
//         "price_html": priceHtml,
//         "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
//         // "meta_data": List<dynamic>.from(metaData.map((x) => x.toMap())),
//         "stock_status": stockStatus,
//         "has_options": hasOptions,
//         "_links": links.toMap(),
//       };
// }

// enum Backorders { THE_8_OZ, ALOE, AVOCADO_OIL, NO, VITAMIN_E, YES }

// // final backordersValues = EnumValues({
// //   "aloe": Backorders.ALOE,
// //   "avocado-oil": Backorders.AVOCADO_OIL,
// //   "no": Backorders.NO,
// //   "8oz": Backorders.THE_8_OZ,
// //   "vitamin-e": Backorders.VITAMIN_E,
// //   "yes": Backorders.YES
// // });

// class Category {
//   Category({
//     required this.id,
//     required this.name,
//     required this.slug,
//   });

//   int id;
//   String name;
//   String slug;

//   factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Category.fromMap(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//       };
// }

// class Dimensions {
//   Dimensions({
//     required this.length,
//     required this.width,
//     required this.height,
//   });

//   String length;
//   String width;
//   String height;

//   factory Dimensions.fromJson(String str) =>
//       Dimensions.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Dimensions.fromMap(Map<String, dynamic> json) => Dimensions(
//         length: json["length"],
//         width: json["width"],
//         height: json["height"],
//       );

//   Map<String, dynamic> toMap() => {
//         "length": length,
//         "width": width,
//         "height": height,
//       };
// }

// class Links {
//   Links({
//     required this.self,
//     required this.collection,
//   });

//   List<Collection> self;
//   List<Collection> collection;

//   factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Links.fromMap(Map<String, dynamic> json) => Links(
//         self: List<Collection>.from(
//             json["self"].map((x) => Collection.fromMap(x))),
//         collection: List<Collection>.from(
//             json["collection"].map((x) => Collection.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "self": List<dynamic>.from(self.map((x) => x.toMap())),
//         "collection": List<dynamic>.from(collection.map((x) => x.toMap())),
//       };
// }

// class Collection {
//   Collection({
//     required this.href,
//   });

//   String href;

//   factory Collection.fromJson(String str) =>
//       Collection.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Collection.fromMap(Map<String, dynamic> json) => Collection(
//         href: json["href"],
//       );

//   Map<String, dynamic> toMap() => {
//         "href": href,
//       };
// }

// // class MetaDatum {
// //   MetaDatum({
// //     required this.id,
// //     required this.key,
// //     this.value,
// //   });

// //   int id;
// //   Key key;
// //   dynamic value;

// //   factory MetaDatum.fromJson(String str) => MetaDatum.fromMap(json.decode(str));

// //   String toJson() => json.encode(toMap());

// //   factory MetaDatum.fromMap(Map<String, dynamic> json) => MetaDatum(
// //         id: json["id"],
// //         key: keyValues.map[json["key"]],
// //         value: json["value"],
// //       );

// //   Map<String, dynamic> toMap() => {
// //         "id": id,
// //         "key": keyValues.reverse[key],
// //         "value": value,
// //       };
// // }

// // enum Key {
// //   WXR_IMPORT_USER_SLUG,
// //   WXR_IMPORT_TERM,
// //   GENERATEPRESS_SITES_IMPORTED_POST
// // }

// // final keyValues = EnumValues({
// //   "_generatepress_sites_imported_post": Key.GENERATEPRESS_SITES_IMPORTED_POST,
// //   "_wxr_import_term": Key.WXR_IMPORT_TERM,
// //   "_wxr_import_user_slug": Key.WXR_IMPORT_USER_SLUG
// // });

// // class ValueClass {
// //   ValueClass({
// //     required this.taxonomy,
// //     required this.slug,
// //     required this.name,
// //   });

// // Taxonomy taxonomy;
// // Backorders slug;
// // Name name;

// // factory ValueClass.fromJson(String str) =>
// //     ValueClass.fromMap(json.decode(str));

// // String toJson() => json.encode(toMap());

// // factory ValueClass.fromMap(Map<String, dynamic> json) => ValueClass(
// //       taxonomy: taxonomyValues.map[json["taxonomy"]],
// //       slug: backordersValues.map[json["slug"]],
// //       name: nameValues.map[json["name"]],
// //     );

// // Map<String, dynamic> toMap() => {
// //       "taxonomy": taxonomyValues.reverse[taxonomy],
// //       "slug": backordersValues.reverse[slug],
// //       "name": nameValues.reverse[name],
// //     };
// // }

// // enum Name { THE_8_OZ, ALOE, AVOCADO_OIL, NO, VITAMIN_E, YES }

// // final nameValues = EnumValues({
// //   "Aloe": Name.ALOE,
// //   "Avocado Oil": Name.AVOCADO_OIL,
// //   "No": Name.NO,
// //   "8oz": Name.THE_8_OZ,
// //   "Vitamin E": Name.VITAMIN_E,
// //   "Yes": Name.YES
// // });

// // enum Taxonomy {
// //   PA_WEIGHT,
// //   PA_INGREDIENTS,
// //   PA_HYPOALLERGENIC,
// //   PA_ORGANIC,
// //   PA_FRAGRANCE_FREE
// // }

// // final taxonomyValues = EnumValues({
// //   "pa_fragrance-free": Taxonomy.PA_FRAGRANCE_FREE,
// //   "pa_hypoallergenic": Taxonomy.PA_HYPOALLERGENIC,
// //   "pa_ingredients": Taxonomy.PA_INGREDIENTS,
// //   "pa_organic": Taxonomy.PA_ORGANIC,
// //   "pa_weight": Taxonomy.PA_WEIGHT
// // });

// // class EnumValues<T> {
// //   Map<String, T> map;
// //   Map<T, String> reverseMap;

// //   EnumValues(this.map);

// //   Map<T, String> get reverse {
// //     if (reverseMap == null) {
// //       reverseMap = map.map((k, v) => new MapEntry(v, k));
// //     }
// //     return reverseMap;
// //   }
// // }
