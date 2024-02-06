// bool _isFavorite = false;
//   final List<Quote> _favoriteQuotes = [];

//   _isFavorite = false;
//   // Create a new Quote instance with isFavorite set to false
//         Quote newQuote = Quote(content: _quotes!, author: _author!);
//         // Check if the quote is already in favorites to set isFavorite
//         if (_favoriteQuotes.contains(newQuote)) {
//           newQuote.isFavorite = true;
//         }
//         _favoriteQuotes.add(newQuote);

        // if (_quotes != null)
        //   Container(
        //     decoration: BoxDecoration(
        //       color: Colors.deepPurple.shade200,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: SizedBox(
        //         child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         favIcon(),
        //       ],
        //     )),
        //   )
      //         actions: [
      //   IconButton(
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const FavouriteListCard(),
      //           ),
      //         );
      //       },
      //       icon: const Icon(
      //         Icons.favorite_border,
      //         color: Colors.black,
      //       ))
      // ],

//favourite

//  final snackBar = SnackBar(
//           backgroundColor: _isFavorite ? Colors.red : Colors.green,
//           content: Text(
//             _isFavorite ? 'Removed from Favorites' : 'Added to Favorites',
//             style: GoogleFonts.poppins(
//               textStyle: const TextStyle(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         );

//         const Duration(microseconds: 3);
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         if (_isFavorite) {
//           // Remove from favorites (implement your logic here)
//         } else {
//           // Add to favorites (implement your logic here)
//         }

  //sharelogic
  // IconButton shareLogic() {
  //   return IconButton(
  //     onPressed: () {
  //       final snackBar = SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text(
  //           'Share Successfully',
  //           style: GoogleFonts.poppins(
  //             textStyle: const TextStyle(
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ),
  //       );

  //       const Duration(microseconds: 3);
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     },
  //     icon: const Icon(Icons.share_sharp),
  //   );
  // }

//download logic
  // IconButton downLoadLogic() {
  //   return IconButton(
  //     onPressed: () {
  //       final snackBar = SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text(
  //           'Downloaded Successfully',
  //           style: GoogleFonts.poppins(
  //             textStyle: const TextStyle(
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ),
  //       );

  //       const Duration(microseconds: 3);
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     },
  //     icon: const Icon(Icons.download),
  //   );
  // }
  
// //favorite icon logics
// IconButton favIcon() {
//   return IconButton(
//     onPressed: () {
//       setState(() {
//         _isFavorite = !_isFavorite;
//       });
//     },
//     icon: _isFavorite
//         ? Icon(Icons.favorite, color: Colors.red.shade800)
//         : const Icon(Icons.favorite_border),
//   );
// }

