import 'dart:async';
import 'package:demo_project/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_project/features/usermanagement/models/user.dart';
import 'package:demo_project/utils/services/db_service.dart';
import 'package:demo_project/utils/logs/log_utils.dart';

class UserListController extends GetxController {
  RxList<User> users = <User>[].obs;
  RxBool isLoading = false.obs;
  RxBool isFetchingMore = false.obs;
  RxBool hasMoreData = true.obs;

  int _currentPage = 1;
  final int _limit = AppConstants.defaultPageSize;

  TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  RxString currentSearchQuery = ''.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
    fetchUsers(isRefresh: true);
    LogUtils.info('UserListController initialized');
  }

  @override
  void onClose() {
    scrollController.dispose();
    searchController.dispose();
    _debounce?.cancel();
    super.onClose();
    LogUtils.info('UserListController closed');
  }

  void _onScroll() {
    // Increase threshold to 500 for more "automatic" seamless loading
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 500) {
      if (!isFetchingMore.value && !isLoading.value && hasMoreData.value) {
        LogUtils.info('Pagination triggered by scroll threshold');
        fetchUsers();
      }
    }
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (currentSearchQuery.value != query) {
        LogUtils.info('Searching for: $query');
        currentSearchQuery.value = query;
        fetchUsers(isRefresh: true);
      }
    });
  }

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      hasMoreData.value = true;
      users.clear();
      isLoading.value = true;
      LogUtils.info('Refreshing user list');
    } else {
      // Guard against concurrent fetches or end of data
      if (isFetchingMore.value || isLoading.value || !hasMoreData.value) return;
      isFetchingMore.value = true;
      LogUtils.info('Fetching more users: Page $_currentPage');

      // Artificial delay to show loading indicator (3 seconds as requested)
      // This only happens during pagination as per latest requirement
      await Future.delayed(const Duration(seconds: 3));
    }

    try {
      final fetchedUsers = await DbService.getUsersPaginated(
        searchQuery: currentSearchQuery.value,
        page: _currentPage,
        limit: _limit,
      );

      if (fetchedUsers.length < _limit) {
        hasMoreData.value = false;
        LogUtils.info('No more data to fetch');
      }

      users.addAll(fetchedUsers);
      _currentPage++;
    } catch (e, stack) {
      LogUtils.error('Failed to fetch users', e, stack);
      Get.snackbar('Error', 'Failed to fetch users: $e');
    } finally {
      isLoading.value = false;
      isFetchingMore.value = false;
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await DbService.deleteUser(id);
      users.removeWhere((u) => u.id == id);
      LogUtils.info('User deleted: $id');
      Get.snackbar('Success', 'User deleted successfully');
    } catch (e, stack) {
      LogUtils.error('Failed to delete user', e, stack);
      Get.snackbar('Error', 'Failed to delete user: $e');
    }
  }

  void addUserToList(User user) {
    users.insert(0, user);
    LogUtils.info('Manual UI add at top: ${user.email}');
  }

  void updateUserInList(User user) {
    final index = users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      users[index] = user;
      LogUtils.info('Manual UI update at position $index: ${user.email}');
    }
  }
}
