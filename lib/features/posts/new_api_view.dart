import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pay_wallet/features/posts/post_viewmodel.dart';

class ApiRest extends ConsumerStatefulWidget {
  const ApiRest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ApiRestState();
}

class _ApiRestState extends ConsumerState<ApiRest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      ref.watch(splashViewModel.notifier).getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final apiState = ref.watch(splashViewModel);
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: switch (apiState.loadingState) {
          LoadingState.loading => const CircularProgressIndicator(),
          LoadingState.failed =>
            const Center(child: Text('Could not get contacts')),
          _ when apiState.getPosts!.isEmpty => const Center(
                child: Text(
              'No contacts found in device',
              style: TextStyle(color: Colors.black),
            )),
          _ => ListView.builder(
              itemCount: apiState.getPosts!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(apiState.getPosts![index].id.toString()),
                  subtitle: Text(apiState.getPosts![index].title!),
                  trailing: Text(apiState.getPosts![index].userID.toString()),
                );
              },
            ),
        },
      ),
    ));
  }
}
