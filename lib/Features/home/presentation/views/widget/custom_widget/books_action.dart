
import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:bookly_app/core/utils/functions/launch_uri.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children:  [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),),

            ),
          ),

          Expanded(
            child: CustomButton(
              onPressed: ()async{
                launchCustomUr(context, bookModel.volumeInfo.previewLink);

              },
              fontSize: 16,
              text: getText(bookModel),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),),

            ),
          ),

        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null){
      return 'Not Avaliable';
    }else{
      return 'Preview';
    }

  }
}

