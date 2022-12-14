// import 'dart:developer';

// import 'package:bimarestan/core/resources/assets_manager.dart';
// import 'package:bimarestan/core/utils/media_query_values.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_svg/parser.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../core/utils/extensions.dart';
// import 'package:flutter/material.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme;

//     log(context.width.toString());
//     log(context.height.toString());
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(18),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SvgPicture.asset(
//                   SvgAssets.undraw_login,
//                   height: context.height / 4,
//                 ),
//                 const SizedBox(height: 24),
//                 const Text(
//                   'Login',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         bottom: 10.5,
//                         right: 8,
//                       ),
//                       child: Icon(
//                         Icons.alternate_email_outlined,
//                         color: theme.colorScheme.onSurface,
//                       ),
//                     ),
//                     const Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(hintText: 'Email'),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         bottom: 10.5,
//                         right: 8,
//                       ),
//                       child: Icon(
//                         Icons.lock_outlined,
//                         color: theme.colorScheme.onSurface,
//                       ),
//                     ),
//                     const Flexible(
//                       child: TextField(
//                         decoration: InputDecoration(
//                             hintText: 'Password',
//                             suffixIcon: Icon(Icons.visibility_off_outlined)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Align(
//                   alignment: AlignmentDirectional.centerEnd,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: const Text('Forgot Password?'),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 SizedBox(
//                   height: 48,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       EasyLoading.show(indicator: CircularProgressIndicator());
//                     },
//                     child: Text(
//                       'Login',
//                       style: theme.textTheme.labelLarge?.copyWith(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Row(
//                   children: [
//                     const Expanded(child: Divider(thickness: 1)),
//                     const SizedBox(width: 8),
//                     Text(
//                       'OR',
//                       style:
//                           TextStyle(color: theme.colorScheme.onSurfaceVariant),
//                     ),
//                     const SizedBox(width: 8),
//                     const Expanded(child: Divider(thickness: 1)),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   height: 48,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         foregroundColor: theme.colorScheme.onSurface,
//                         backgroundColor: theme.colorScheme.surface,
//                         padding: const EdgeInsets.symmetric(horizontal: 24)),
//                     onPressed: () {
//                       EasyLoading.dismiss();
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SvgPicture.asset(
//                           SvgAssets.google_logo,
//                           height: 28,
//                         ),
//                         const Text('Login with Google'),
//                         const Icon(
//                           Icons.golf_course,
//                           color: Colors.transparent,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('New to Logistics?'),
//                     TextButton(onPressed: () {}, child: Text('Register'))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
