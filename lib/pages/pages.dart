import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:pack_me/config/configs.dart';
import 'package:pack_me/config/pack_me_icons.dart';
import 'package:pack_me/cubit/auth_cubit.dart';
import 'package:pack_me/widgets/default_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication/cta_auth_page.dart';
part 'authentication/sign_up_email.dart';
part 'authentication/sign_in_page.dart';
part 'authentication/onboarding_pages.dart';
part 'authentication/reset_password_page.dart';
part 'authentication/change_name_page.dart';
part 'authentication/change_address_page.dart';
part 'authentication/mitra_pro_registration.dart';
part 'template/back_frame_page.dart';
part 'template/onboarding_page.dart';
part 'template/error_state_page.dart';
part 'template/success_state_page.dart';
part 'template/help_page.dart';
part 'home/home_page.dart';
part 'home/profile_page.dart';
part 'home/about_us.dart';
part 'home/history_page.dart';
part 'home/promotion_page.dart';
part 'home/detailed_promotion_page.dart';
part 'home/transfer_page.dart';
part 'home/qr_code_page.dart';
part 'home/choose_pack_page.dart';
part 'home/transfer_pack_confirmation.dart';
part 'home/rent_code_page.dart';
part 'home/rent_pack_confirmation.dart';
part 'home/return_method_page.dart';
part 'home/point_location_page.dart';
part 'home/withdraw_page.dart';
part 'home/qr_code_scanner.dart';
part 'home/map_page.dart';

