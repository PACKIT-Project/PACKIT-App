import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:packit/app/config/app_typeface.dart';
import 'package:packit/app/config/routes/route_path.dart';
import 'package:packit/domain/entities/check_list_response.dart';
import 'package:packit/presentation/main/controller/tour_controller.dart';
import 'package:packit/presentation/widget/packit_appbar.dart';
import 'package:packit/presentation/widget/packit_dialog.dart';

class ClusterManagePage extends GetView<TourController> {
  const ClusterManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PackitBackAppBar(title: "할 일 관리"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 22.92.h),
              Obx(
                () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.selectedCheckList.value!.travelClusterList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _ClusterDetailWidget(controller.selectedCheckList.value!.travelClusterList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ClusterDetailWidget extends StatelessWidget {
  const _ClusterDetailWidget(this.cluster);

  final ClusterResponse cluster;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                cluster.title,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: AppColor.gray5, overflow: TextOverflow.ellipsis),
              ),
            ),
            GestureDetector(
                onTap: () async => await showPackitDialog(context, PackitDialogType.deleteCluster, cluster.clusterId),
                child: Text("삭제", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray300))),
          ],
        ),
        SizedBox(height: 6.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cluster.travelCategoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Get.toNamed(RoutePath.clusterDetail, arguments: cluster.travelCategoryList[index]),
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.5.w),
                margin: EdgeInsets.only(bottom: 8.h),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColor.gray1),
                child: Text(
                  cluster.travelCategoryList[index].title,
                  style: AppTypeFace.to.body6Medium.copyWith(color: AppColor.coolGray300),
                ),
              ),
            );
          },
        ),
        GestureDetector(
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: AppColor.gray3,
            dashPattern: const [4, 4],
            radius: Radius.circular(6.r),
            strokeWidth: 1,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 7.w),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
              child: Container(
                width: 20.w,
                height: 20.w,
                decoration: const BoxDecoration(color: AppColor.gray1, shape: BoxShape.circle),
                child: Icon(Icons.add, size: 18.w, color: AppColor.coolGray100),
              ),
            ),
          ),
        ),
        SizedBox(height: 23.h),
      ],
    );
  }
}
