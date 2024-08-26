import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/mainhomepage_controller.dart';
import 'package:mvc_commers/view/widget/mainhomepage/customitembottomappbar.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainhomepageControllerImp>(
      builder: (controller) {
        return BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 5,
              padding: const EdgeInsets.all(0),
              height: 50,
              child: Row(
                children: [
                  ...List.generate(
                    controller.pages.length,
                    (index) {
                      int i = controller.curentPage;
                      return index == 2
                          ? const Spacer()
                          : CustomItemBottomAppBar(
                              isactive: i == index ? true : false,
                              onPressed: () {
                                controller.changePage(index);
                              },
                              textbutton: controller.pages[index][1],
                              iconData: controller.pages[index][2],
                            );
                    },
                  )
                ],
              ),
            );
      }
    );
  }
}