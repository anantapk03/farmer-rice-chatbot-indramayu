import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_const.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/presentation/dummy_item_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/presentation/dummy_item_state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/model/dummy_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DummyItemScreen extends StatefulWidget {
  const DummyItemScreen({super.key});

  @override
  State<DummyItemScreen> createState() => _DummyItemScreenState();
}

class _DummyItemScreenState extends State<DummyItemScreen> {
  final _controller = Get.find<DummyItemController>();

  @override
  void initState() {
    super.initState();
    _controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyBuilder(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        "Detail Dummy Data",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  Widget _bodyBuilder() {
    return GetBuilder<DummyItemController>(builder: (controller) {
      final state = controller.state;
      if (state is DummyItemStateLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is DummyItemStateError) {
        return const Center(
          child: Column(
            children: [
              Icon(Icons.error),
              SizedBox(
                height: 8,
              ),
              Text("ERROR")
            ],
          ),
        );
      }
      if (state is DummyItemStateSuccess) {
        return _body(state.dummyItemModel);
      }
      return Container();
    });
  }

  Widget _body(DummyModel? dummyModel) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(24)),
            child: CachedNetworkImage(
              imageUrl: dummyModel?.meals?.first.strMealThumb ??
                  AppConst.imageExample,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image, size: 100, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Makanan
                Text(
                  dummyModel?.meals?.first.strMeal ?? "Name Of Meal",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                // Tipe Makanan
                Text(
                  dummyModel?.meals?.first.strCategory ?? "Type Of Meal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),

                // Deskripsi
                Text(
                  dummyModel?.meals?.first.strInstructions ?? "Description",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
