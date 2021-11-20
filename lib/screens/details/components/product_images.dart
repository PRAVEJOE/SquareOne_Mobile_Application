import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:square_one_mobile_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  int Value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                indicatorColor: Colors.white24,
                indicatorBackgroundColor: Colors.white24,
                onPageChanged: (value) {
                  setState(() {
                    selectedImage = value;
                    debugPrint('Page changed: $Value');
                    if (value == 0) {
                      selectedImage = 0;
                    }
                    if (value == 1) {
                      selectedImage = 1;
                    }
                    if (value == 2) {
                      selectedImage = 2;
                    }
                    debugPrint('Page changed: $selectedImage');
                  });
                },
                autoPlayInterval: 0,
                isLoop: true,
                children: [
                  selectedImage == 0
                      ? Image.asset(
                          widget.product.images[0],
                        )
                      : Image.asset(
                          widget.product.images[selectedImage],
                        ),
                  selectedImage == 1
                      ? Image.asset(
                          widget.product.images[1],
                        )
                      : Image.asset(
                          widget.product.images[selectedImage],
                        ),
                  selectedImage == 2
                      ? Image.asset(
                          widget.product.images[2],
                        )
                      : Image.asset(
                          widget.product.images[selectedImage],
                        ),
                ],
              ),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}
