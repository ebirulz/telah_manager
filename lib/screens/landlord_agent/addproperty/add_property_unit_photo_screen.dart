import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_dividers.dart';
import 'add_property_unit_status_screen.dart';

import '../../../util/size_model.dart';
import '../../../widgets/custom_buttons.dart';


class PhotoUpload extends StatefulWidget {
  const PhotoUpload({Key? key}) : super(key: key);

  @override
  State<PhotoUpload> createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  TextEditingController filecontroller = TextEditingController();
  List images = [];
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h50,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                LinearProgressIndicator(
                  backgroundColor: Colors.grey.withOpacity(.5),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: .8,
                ),
                customDivider(height: Sizes.h50),
                Center(
                  child: Image.asset(
                    'assets/icons/photo.png',
                    width: Sizes.w70,
                  ),
                ),
                customDivider(height: Sizes.h20),
                Text(
                  'Photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'Let’s see a shot of your beautiful property!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                customDivider(height: Sizes.h30),
                images.isEmpty
                    ? Container(
                        height: Sizes.h200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(Sizes.w10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/circleadd.png',
                              width: Sizes.w50,
                            ),
                            customDivider(height: Sizes.h10),
                            Text(
                              'Add photo',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Sizes.w12,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      )
                    : images.length == 1
                        ? singleImgae()
                        : multiImage(),
                customDivider(height: Sizes.h30),
                GestureDetector(
                  onTap: pickfile,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      customVerticalDivider(width: Sizes.w5),
                      Text(
                        'Add photo',
                        style:
                            TextStyle(color: Colors.blue, fontSize: Sizes.w15),
                      )
                    ],
                  ),
                ),
                customDivider(height: Sizes.h100),
                ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  singleImgae() {
    return Container(
      height: Sizes.h200,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.5)),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.w10))),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.w10)),
        child: Image.file(
          images[0],
          width: double.infinity,
        ),
      ),
    );
  }

  multiImage() {
    double totalWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: images
            .map((e) => Padding(
                  padding: EdgeInsets.only(right: Sizes.w10),
                  child: Container(
                    height: Sizes.h200,
                    width: totalWidth - 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(.5)),
                        borderRadius:
                            BorderRadius.all(Radius.circular(Sizes.w10))),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(Sizes.w10)),
                      child: Image.file(
                        e,
                        // width: totalWidth,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  pickfile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        images.add(File(result.files.single.path!));
      });
    } else {
      // User canceled the picker
    }
  }

  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const UnitStatus()));
  }
}
