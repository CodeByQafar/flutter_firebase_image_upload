import 'package:flutter/material.dart';

import '../../image upload/view/image_upload_view.dart';
import '../../image viewer/view/image_viewer_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TapName.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TapName.values.length,

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Image Upload'),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            tabs: const <Tab>[
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.upload), Text('Upload')],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.image), Text('View')],
                ),
              ),
            ],
          ),
        ),

        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children:  [ImageUploadView(), ImageViewerView()],
          ),
        ),
      ),
    );
  }
}

enum TapName { imageUpload, imageViewer }
