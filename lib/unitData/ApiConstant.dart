class ApiConstant {
  static String baseurl = "https://catalogease.akshayanidhi.digital/api/";
  static String login = "${baseurl}user/login";
  static String create = "${baseurl}user/create";
  static String verify = "${baseurl}user/otp/verify";
  static String forgotPassword = "${baseurl}user/forgot-password/otp";
  static String passwordUpdate = "${baseurl}user/password_update";
  static String category = "${baseurl}main-category";
  static String subCategory = "${baseurl}category";
  static String solitaire = "${baseurl}sub-category";
  static String products = "${baseurl}products";
  static String productsDetails = "${baseurl}product/details";
  static String filterOption = "${baseurl}products/filter-option";
  static String cartAdd = "${baseurl}order/cart/add";
  static String userProfile = "${baseurl}user/profile";
  static String cartGet = "${baseurl}order/cart/get";
  static String cartDelete = "${baseurl}order/cart/delete";
  static String orderCreate = "${baseurl}order/create";
  static String updatePassword = "${baseurl}user/update-password";
  static String profileEdit = "${baseurl}user/profile/edit";
  static String orderGet = "${baseurl}order/get";
  static String orderDetails = "${baseurl}order/details";
  static String orderCancel = "${baseurl}order/cancel";
  static String ringsSize = "${baseurl}rings/size";
}
