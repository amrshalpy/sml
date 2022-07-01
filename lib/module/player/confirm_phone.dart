import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';

class ConfimPhone extends StatelessWidget {
  String phone = ' mobile number';
  ConfimPhone({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(alignment: AlignmentDirectional.center, children: [
        crdientColor(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            logo(),
            SizedBox(
              height: 180,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: secandContainer(
                txt: 'Mobile number',
                icon: Icons.phone_callback,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 120,
                      child: mainButton(
                          txt: 'respond',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          ontap: () {}),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: defaultText(
                          txt: 'Enter Code',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: TextField(
                        onChanged: (String val) {},
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 30),
                            hintText: 'code'),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    mainButton(
                        txt: 'Send',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        ontap: () {})
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
