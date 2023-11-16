// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pay_wallet/core/api_exceptions/api_exceptions.dart';
import 'package:pay_wallet/core/api_exceptions/base_response.dart';

import 'package:pay_wallet/model/post_model.dart';
import 'package:pay_wallet/services/api_service.dart';

class ApiModel extends StateNotifier<ApiState> {
  ApiModel(this.apiService) : super(ApiState());
  final ApiService apiService;
  getPosts() async {
    state = state.copyWith(loadingState: LoadingState.loading);

    try {
      final gottenPosts = await apiService.getPosts();
      log('$gottenPosts');
      state = state.copyWith(
          loadingState: LoadingState.success, getPosts: gottenPosts);
      return BaseResponse<List<PostModel>>(
        status: true,
        data: gottenPosts,
      );
    } on DioException catch (e) {
      AppException.handleError(e);
      state = state.copyWith(loadingState: LoadingState.failed);
    }
  }
}

class ApiState {
  LoadingState loadingState;
  List<PostModel>? getPosts;
  ApiState({
    this.loadingState = LoadingState.loading,
    this.getPosts,
  });

  ApiState copyWith({
    LoadingState? loadingState,
    List<PostModel>? getPosts,
  }) {
    return ApiState(
      loadingState: loadingState ?? this.loadingState,
      getPosts: getPosts ?? this.getPosts,
    );
  }
}

enum LoadingState { idle, loading, failed, success }

final splashViewModel = StateNotifierProvider<ApiModel, ApiState>(
    (ref) => ApiModel(ApiService(Dio())));
