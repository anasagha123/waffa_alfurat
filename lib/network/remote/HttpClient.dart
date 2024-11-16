
import 'package:get/get_connect/http/src/http.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:waffat_alfurat/components/snack_bar.dart';

class HttpClient {
  static GetHttpClient? getHttpClient;

  static void init() {
    getHttpClient = GetHttpClient(
        baseUrl: 'https://wafaaalfurat.store/api/',
    );
  }

  static Future getData({
    required final String path,
    final Map<String, dynamic>? query,
    final Map<String, dynamic>? data,
  }) async {
    try {
      return await getHttpClient
          ?.get(
        path,
        query: query,
        // : data,
      )
          .onError((error, stackTrace) {
        showSnackBar(
          title: "خطأ",
          message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
          state: SnackBarState.error,
        );
        return const Response();
      });
    } catch (_) {
      showSnackBar(
        title: "خطأ",
        message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
        state: SnackBarState.error,
      );
    }
  }

  static Future postData({
    required final String path,
    required final Map<String, dynamic> body,
    final Map<String, dynamic> query = const {},
  }) async {
    try {
      return await getHttpClient
          ?.post(
        path,
        body: body,
        query: query,
      )
          .onError((error, stackTrace) {
        showSnackBar(
            message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
            state: SnackBarState.error,
            title: "خطأ");
        return const Response();
      });
    } catch (_) {
      showSnackBar(
        title: "خطأ",
        message: "حدث خطأ في التصال الرجاء اعادة المحاولة",
        state: SnackBarState.error,
      );
    }
  }

  static Future putData({
    required final String path,
    final Map<String, dynamic> body = const {},
    final Map<String, dynamic> query = const {},
  }) async {
    try {
      return await getHttpClient
          ?.put(
        path,
        body: body,
        query: query,
      )
          .onError((error, stackTrace) {
        showSnackBar(
            message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
            state: SnackBarState.error,
            title: "خطأ");
        return const Response();
      });
    } catch (_) {
      showSnackBar(
        title: "خطأ",
        message: "حدث خطأ في التصال الرجاء اعادة المحاولة",
        state: SnackBarState.error,
      );
    }
  }

  static Future deleteData({
    required final String path,
    final Map<String, dynamic>? data,
    final Map<String, dynamic>? query,
  }) async {
    try {
      return await getHttpClient
          ?.delete(
        path,
        // bod: data,
        query: query,
      )
          .onError((error, stackTrace) {
        showSnackBar(
            message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
            state: SnackBarState.error,
            title: "خطأ");
        return const Response();
      });
    } catch (_) {
      showSnackBar(
        title: "خطأ",
        message: "حدث خطأ في التصال الرجاء اعادة المحاولة",
        state: SnackBarState.error,
      );
    }
  }
}

final class EndPoints {
  static const String customerLogin = "customers_login";
  static const String customerRegister = "customers";
  static const String agentLogin = "agents_login";
  static const String agentRegister = "agents";
  static const String viewAgents = "agents";
  static const String viewProducts = "products";
  static const String viewGifts = "gifts";
  static const String viewInvoicesForCustomer = "invoices_customers";
  static const String viewInvoicesForAgents = "invoices_agents";
  static const String getCustomerPoints = "customers_points";
  static const String getAgentPoints = "agents_points";
  static const String deleteAgent = "agent/";
  static const String deleteCostumer = "customer/";
  static const String getBanners = "banners";
  static const String getPosts = "posts";
  static const String getBrands = "brands";
  static const String getPostsCount = "posts/count";
  static const String requestGift = "gift-requests";
  static const String postFCMToken = "fcm_token";
}
