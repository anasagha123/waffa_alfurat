// ignore_for_file: avoid_print, file_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:waffat_alfurat/components/snack_bar.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://wafaaalfurat.store/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future getData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await dio
          ?.get(
        path,
      )
          .onError((error, stackTrace) {
        showSnackBar(
          title: "خطأ",
          message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
          state: SnackBarState.error,
        );
        return Response(requestOptions: RequestOptions());
      });
    } on DioException catch (_) {
      showSnackBar(
        title: "خطأ",
        message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
        state: SnackBarState.error,
      );
    }
  }

  static Future postData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio
          ?.post(
        path,
        data: jsonEncode(data),
      )
          .onError((error, stackTrace) {
        print(error.toString());
        showSnackBar(
            message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
            state: SnackBarState.error,
            title: "خطأ");
        return Response(requestOptions: RequestOptions());
      });
    } on DioException catch (_) {
      showSnackBar(
        title: "خطأ",
        message: "حدث خطأ في التصال الرجاء اعادة المحاولة",
        state: SnackBarState.error,
      );
    }
  }

  static Future deleteData(
      {required String path, Map<String, dynamic>? data}) async {
    try {
      return await dio
          ?.delete(
        path,
        data: jsonEncode(data),
      )
          .onError((error, stackTrace) {
        print(error.toString());
        showSnackBar(
            message: "حدث خطأ في الاتصال الرجاء اعادة المحاولة",
            state: SnackBarState.error,
            title: "خطأ");
        return Response(requestOptions: RequestOptions());
      });
    } on DioException catch (_) {
      showSnackBar(
        title: "خطأ",
        message: "حدث خطأ في التصال الرجاء اعادة المحاولة",
        state: SnackBarState.error,
      );
    }
  }
}

class EndPoints {
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
  static const String deleteCostumer = "costumer/";
}
