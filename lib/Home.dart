import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/fontcontroller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final fontcontroller controller = Get.put(fontcontroller());

  @override
  Widget build(BuildContext context) {
    print('hello rafi');
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx'),
        actions: [
          IconButton(
              onPressed: () {
                Get.changeTheme(ThemeData.light());
              },
              icon: Icon(FontAwesomeIcons.sun)),
          IconButton(
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
              },
              icon: Icon(FontAwesomeIcons.moon))
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                controller.notification.value == true ? 'Hello Rafi' : 'Hi',
                style: TextStyle(fontSize: controller.fontsize.value),
              );
            }),
            Obx(() {
              return Slider(
                min: 10,
                max: 50,
                value: controller.fontsize.value,
                onChanged: (size) {
                  controller.updatefontsize(size.obs);
                },
              );
            }),
            Obx(() {
              return Switch(
                  value: controller.notification.value,
                  onChanged: (Value) {
                    controller.notificationcontroller(Value);
                  });
            }),
            Expanded(
              child: ListView.builder(
                  itemCount: controller.fruitslist.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ListTile(
                          onTap: () {
                            if (controller.favtfruits
                                .contains(controller.fruitslist[index])) {
                              controller.favtfruits
                                  .remove(controller.fruitslist[index]);
                            } else {
                              controller.favtfruits
                                  .add(controller.fruitslist[index]);
                            }
                          },
                          title: Text(controller.fruitslist[index]),
                          trailing: Icon(
                            Icons.favorite_border,
                            color: controller.favtfruits
                                    .contains(controller.fruitslist[index])
                                ? Colors.red
                                : Colors.black,
                          ),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
