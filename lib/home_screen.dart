import 'package:flutter/material.dart';
import 'package:flutter_topics/Data/passenger_model.dart';
import 'package:flutter_topics/services/api_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController refreshController = RefreshController(initialRefresh: true);
  @override
  void initState() {
    super.initState();
  }

  List<Data>? passenger = [];
  int currentPage = 0;

  getPassenger({bool isRefresh = false}) async {
    final result = await ApiServices.getPassengers(currentPage: currentPage);
    int totalPages = result.totalPages!;
    currentPage++;

    if (isRefresh) {
      currentPage = 0;
      passenger = result.data;
    } else {
      passenger!.addAll(result.data as Iterable<Data>);
    }

    if (currentPage >= totalPages) {
      refreshController.loadNoData();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pagination"),
        ),
        body: SmartRefresher(
          controller: refreshController,
          enablePullUp: true,
          onRefresh: () async {
            final result = await getPassenger(isRefresh: true);
            if (result != null) {
              refreshController.refreshCompleted();
            } else {
              refreshController.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await getPassenger();
            if (result != null) {
              refreshController.loadComplete();
            } else {
              refreshController.loadFailed();
            }
          },
          child: ListView.separated(

              itemCount: passenger!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final result = passenger![index];
                return ListTile(
                  title: Text(result.name!),
                  subtitle: Text(
                    result.airline![0].country!,
                  ),
                  trailing: Text(
                    result.airline![0].name!,
                  ),
                );
              }),
        ));
  }
}
