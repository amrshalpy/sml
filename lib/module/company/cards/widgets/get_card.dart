import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/get_coupon.dart';
import 'package:sportive/module/company/cards/widgets/widgets/new_performance.dart';
import 'package:sportive/module/company/cards/widgets/widgets/update_card.dart';

Widget getCard(Data data,context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: .3, color: Colors.white30)),
    child: Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(onDismissed: () {}),
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            autoClose: true,
            flex: 1,
            onPressed: (value) {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            autoClose: true,
            flex: 1,
            onPressed: (value) {
              nextPage(context: context, page: editCarts(
                context: context,
                id: data.id,
                image: data.image,
                address: data.address,
                discount: data.discount,
                type: data.name,
                ));
            },
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
        dragDismissible: false,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Image.asset(
            'images/CompositeLayer-mdpi.png',
            fit: BoxFit.contain,
            width: 412.w,
            height: 160.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.h, top: 25.h),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: defaultText(
                    txt: 'discount',
                    fontSize: 29.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultText(
                        txt: data.name,
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                    Row(
                      children: [
                        defaultText(
                          txt: 'type: ',
                          color: Colors.redAccent,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        defaultText(
                          txt: data.name,
                          color: Colors.black38,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        defaultText(
                          txt: 'discount: ',
                          color: Colors.redAccent,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        defaultText(
                          txt: data.discount.toString(),
                          color: Colors.black38,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        defaultText(
                          txt: 'Address: ',
                          color: Colors.redAccent,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        defaultText(
                          txt: data.address,
                          color: Colors.black38,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Container(
                      height: 65.h,
                      width: 128.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('${data.image}'),
                        ),
                        border: Border.all(color: Colors.black26, width: .3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: Column(
                  children: [
                    defaultText(
                      txt: 'Football game',
                      color: Colors.black26,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Container(
                      height: 70.h,
                      width: 112.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('images/copun QR.png'),
                      )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        color: Color.fromARGB(255, 59, 158, 1),
                        child: defaultText(
                          txt: '  Genrate QrCode && save  ',
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
// new Slidable(
//   delegate: new SlidableDrawerDelegate(),
//   actionExtentRatio: 0.25,
//   child: new Container(
//     color: Colors.white,
//     child: new ListTile(
//       leading: new CircleAvatar(
//         backgroundColor: Colors.indigoAccent,
//         child: new Text('$3'),
//         foregroundColor: Colors.white,
//       ),
//       title: new Text('Tile n°$3'),
//       subtitle: new Text('SlidableDrawerDelegate'),
//     ),
//   ),
//   actions: <Widget>[
//     new IconSlideAction(
//       caption: 'Archive',
//       color: Colors.blue,
//       icon: Icons.archive,
//       onTap: () => _showSnackBar('Archive'),
//     ),
//     new IconSlideAction(
//       caption: 'Share',
//       color: Colors.indigo,
//       icon: Icons.share,
//       onTap: () => _showSnackBar('Share'),
//     ),
//   ],
//   secondaryActions: <Widget>[
//     new IconSlideAction(
//       caption: 'More',
//       color: Colors.black45,
//       icon: Icons.more_horiz,
//       onTap: () => _showSnackBar('More'),
//     ),
//     new IconSlideAction(
//       caption: 'Delete',
//       color: Colors.red,
//       icon: Icons.delete,
//       onTap: () => _showSnackBar('Delete'),
//     ),
//   ],
// );
