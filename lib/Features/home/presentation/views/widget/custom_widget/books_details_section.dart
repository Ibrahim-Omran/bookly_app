import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../data/models/book_model.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_Item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          // عشان اخلي حجم الصورة ريلتف
          padding: EdgeInsets.symmetric(horizontal: width * .26),
          child:  CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 43,),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6,),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18,),
         BookRating(
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37,),
        BooksAction(bookModel: bookModel,

        ),

      ],
    );
  }
}