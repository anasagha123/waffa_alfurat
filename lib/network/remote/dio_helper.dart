import 'package:dio/dio.dart';
import 'package:waffat_alfurat/components/snack_bar.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://wafaaalfurat.store/api/',
      ),
    );
  }

  static Future getData({
    required final String path,
    final Map<String, dynamic>? query,
    final Map<String, dynamic>? data,
  }) async {
    try {
      return await dio
          ?.get(
        path,
        queryParameters: query,
        data: data,
      )
          .onError((error, stackTrace) {
        showSnackBar(
          title: "خطأ",
          message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
          state: SnackBarState.error,
        );
        return Response(requestOptions: RequestOptions());
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
    required final Map<String, dynamic> data,
    final Map<String, dynamic> query = const {},
  }) async {
    try {
      return await dio
          ?.post(
        path,
        data: data,
        queryParameters: query,
      )
          .onError((error, stackTrace) {
        showSnackBar(
            message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
            state: SnackBarState.error,
            title: "خطأ");
        return Response(requestOptions: RequestOptions());
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
    final Map<String, dynamic> data = const {},
    final Map<String, dynamic> query = const {},
  }) async {
    try {
      return await dio
          ?.put(
        path,
        data: data,
        queryParameters: query,
      )
          .onError((error, stackTrace) {
        showSnackBar(
            message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
            state: SnackBarState.error,
            title: "خطأ");
        return Response(requestOptions: RequestOptions());
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
      return await dio
          ?.delete(
        path,
        data: data,
        queryParameters: query,
      )
          .onError((error, stackTrace) {
        showSnackBar(
            message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
            state: SnackBarState.error,
            title: "خطأ");
        return Response(requestOptions: RequestOptions());
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
}
