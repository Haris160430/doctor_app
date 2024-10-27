import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

class ServicesContainer extends StatelessWidget {
  final String ServiceText;
  final String subText;
  final String buttonText;
  final String url;
  final void Function()? onPressed;

  const ServicesContainer(
      {super.key, required this.ServiceText,
        required this.url,
        required this.subText, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10),
      width:Get.width/1.2,
      decoration: BoxDecoration(
        border:
            const Border(left: BorderSide(color: AppColors.primary, width: 4)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.10),
              spreadRadius: 0.5,
              blurRadius: 0.5)
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              height: 70,
              width: 70,
              fit: BoxFit.fill,
              imageUrl:url,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => SvgPicture.asset("assets/images/serviceicon.svg"),
            ),
          ),
          // SvgPicture.asset(),

          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ServiceText,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                width: Get.width*0.6,
                child: Text(
                  subText,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
