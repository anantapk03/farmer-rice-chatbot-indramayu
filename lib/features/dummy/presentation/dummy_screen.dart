import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/widget/dummy_item_widget.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/model/dummy_model.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/presentation/dummy_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/presentation/dummy_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  final _controller = Get.find<DummyController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(child: _bodyBuilder()),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        "Home",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  Widget _listViewBuilder(DummyModel? listDummy) {
    if (listDummy == null) {
      return const Center(
        child: Text("Empty"),
      );
    }
    return Obx(() {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: DummyItemWidget(
              dummyItemModel: listDummy.meals?[index],
            ),
          );
        },
        itemCount:
            _controller.isShowMore.value ? 3 : listDummy.meals?.length ?? 0,
      );
    });
  }

  Widget _body(DummyModel? listDummy) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: MediaQuery.sizeOf(context).height / 1.25,
              child: _listViewBuilder(listDummy)),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return GestureDetector(
                onTap: () =>
                    _controller.isShowMoreData(_controller.isShowMore.value),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.grey, // Warna latar belakang
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    _controller.isShowMore.value ? "Show More" : "Show Less",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _bodyBuilder() {
    return GetBuilder<DummyController>(
      builder: (controller) {
        final state = controller.dummyState;
        if (state is DummyStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DummyStateError) {
          return const Center(child: Text("Failed to load data"));
        }
        if (state is DummyStateSuccess) {
          return _body(state.listDummy);
        }

        return const Center(
          child: Text("Error"),
        );
      },
    );
  }
}
