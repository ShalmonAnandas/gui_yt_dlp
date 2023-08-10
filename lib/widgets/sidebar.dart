import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gui_yt_dlp/preferences/model_theme.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

final String logo = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMidYMid" width="180" height="60" viewBox="0 0 717 178">
  <defs>
    <style>
      .cls-1, .cls-4 {
        fill: red;
      }
      .cls-1, .cls-2, .cls-3, .cls-4 {
        fill-rule: evenodd;
      }
      .cls-2 {
        fill: #666;
      }
      .cls-3 {
        fill: #fff;
      }
      .cls-3, .cls-4 {
        stroke: #282828;
        stroke-linejoin: round;
        stroke-width: 1px;
      }
    </style>
  </defs>
  <path d="M252.245,116.350 L252.245,102.200 L309.303,102.200 L309.303,116.350 L252.245,116.350 ZM208.254,81.088 L245.342,59.291 L208.254,38.180 L216.242,25.227 L260.862,52.844 L260.862,65.739 L216.413,93.355 L208.254,81.088 Z" class="cls-3"/>
  <path d="M508.108,52.635 C507.921,55.093 507.643,57.527 507.274,59.937 L504.214,78.017 C503.658,81.170 502.754,84.324 501.502,87.475 C500.250,90.628 498.464,93.479 496.147,96.028 C493.829,98.579 491.047,100.503 487.802,101.800 C484.556,103.097 481.311,103.747 478.067,103.747 C476.211,103.747 474.357,103.491 472.504,102.982 C470.648,102.474 469.072,101.615 467.775,100.409 C466.475,99.205 465.410,97.767 464.576,96.098 C463.741,94.429 463.092,92.714 462.629,90.952 L455.953,131.146 L436.482,131.146 L453.310,28.922 L472.921,28.922 L471.391,38.240 C472.504,36.665 473.777,35.180 475.216,33.790 C476.652,32.399 478.228,31.240 479.944,30.313 C481.659,29.387 483.467,28.737 485.369,28.365 C487.268,27.996 489.145,27.809 491.001,27.809 C493.411,27.809 495.706,28.226 497.886,29.061 C500.063,29.895 501.871,31.171 503.310,32.886 C504.746,34.602 505.835,36.549 506.578,38.727 C507.319,40.907 507.806,43.156 508.039,45.472 C508.269,47.791 508.293,50.179 508.108,52.635 ZM487.455,48.184 C486.851,46.841 485.877,45.798 484.534,45.055 C483.189,44.314 481.729,43.942 480.153,43.942 C478.762,43.942 477.393,44.151 476.050,44.568 C474.705,44.986 473.499,45.681 472.434,46.655 C471.367,47.628 470.556,48.765 470.000,50.062 C469.444,51.362 469.027,52.659 468.748,53.956 L465.828,72.037 C465.641,73.149 465.480,74.286 465.341,75.444 C465.202,76.605 465.178,77.717 465.271,78.782 C465.363,79.849 465.526,80.916 465.758,81.981 C465.988,83.048 466.384,84.022 466.940,84.902 C467.497,85.784 468.283,86.456 469.305,86.918 C470.324,87.383 471.391,87.614 472.504,87.614 C474.079,87.614 475.633,87.314 477.163,86.710 C478.693,86.108 480.036,85.204 481.196,83.998 C482.354,82.794 483.235,81.425 483.839,79.895 C484.441,78.365 484.882,76.859 485.160,75.375 L488.081,57.294 C488.359,55.719 488.474,54.143 488.428,52.565 C488.381,50.990 488.057,49.530 487.455,48.184 ZM433.422,86.501 L433.422,102.635 L384.744,102.635 L384.744,86.501 L401.433,86.501 L412.977,16.544 L400.460,16.544 L400.460,0.410 L435.230,0.410 L420.905,86.501 L433.422,86.501 ZM354.285,102.635 L355.815,93.177 C354.793,94.846 353.542,96.354 352.060,97.697 C350.575,99.042 348.976,100.179 347.261,101.105 C345.545,102.033 343.736,102.704 341.837,103.121 C339.936,103.539 338.058,103.747 336.204,103.747 C333.792,103.747 331.497,103.330 329.320,102.495 C327.140,101.661 325.332,100.388 323.896,98.671 C322.457,96.956 321.368,94.985 320.627,92.760 C319.884,90.535 319.397,88.264 319.167,85.945 C318.934,83.628 318.911,81.264 319.097,78.852 C319.282,76.442 319.606,74.032 320.071,71.620 L322.992,53.539 C323.548,50.295 324.452,47.096 325.704,43.942 C326.955,40.791 328.764,37.962 331.128,35.459 C333.492,32.955 336.274,31.056 339.473,29.756 C342.672,28.459 345.892,27.809 349.139,27.809 C351.086,27.809 352.964,28.066 354.772,28.574 C356.580,29.085 358.155,29.943 359.500,31.147 C360.843,32.353 361.934,33.790 362.769,35.459 C363.603,37.128 364.205,38.844 364.577,40.605 L371.253,0.410 L390.724,0.410 L373.895,102.635 L354.285,102.635 ZM362.004,52.705 C361.956,51.592 361.795,50.503 361.517,49.436 C361.239,48.371 360.822,47.419 360.265,46.585 C359.709,45.751 358.920,45.103 357.901,44.638 C356.880,44.175 355.815,43.942 354.702,43.942 C353.124,43.942 351.573,44.245 350.043,44.846 C348.513,45.451 347.168,46.355 346.010,47.559 C344.849,48.765 343.969,50.110 343.367,51.592 C342.763,53.076 342.370,54.606 342.185,56.182 L339.125,74.262 C338.847,75.840 338.730,77.415 338.777,78.991 C338.823,80.569 339.147,82.029 339.751,83.372 C340.353,84.717 341.326,85.760 342.672,86.501 C344.015,87.244 345.475,87.614 347.053,87.614 C348.443,87.614 349.810,87.405 351.156,86.988 C352.499,86.571 353.705,85.875 354.772,84.902 C355.836,83.928 356.671,82.794 357.275,81.494 C357.877,80.197 358.270,78.900 358.457,77.600 L361.517,59.520 C361.702,58.407 361.841,57.272 361.934,56.112 C362.026,54.954 362.049,53.817 362.004,52.705 Z" class="cls-4"/>
</svg>
''';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        return SidebarX(
          controller: _controller,
          extendedTheme: const SidebarXTheme(
            width: 180,
          ),
          theme: SidebarXTheme(
            selectedTextStyle: GoogleFonts.quicksand(
                color: themeNotifier.isDark ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold),
            textStyle: GoogleFonts.quicksand(
                color: themeNotifier.isDark ? Colors.white : Colors.black),
            hoverColor: Colors.black87,
            hoverTextStyle: const TextStyle(color: Colors.white),
            itemTextPadding:
                const EdgeInsets.only(left: 30, top: 10, bottom: 10),
            selectedItemTextPadding:
                const EdgeInsets.only(left: 30, top: 10, bottom: 10),
            itemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: canvasColor),
            ),
            iconTheme: IconThemeData(
              color: themeNotifier.isDark ? Colors.white : Colors.black,
              size: 30,
            ),
            selectedIconTheme: IconThemeData(
              color: themeNotifier.isDark ? Colors.black : Colors.white,
              size: 30,
            ),
            selectedItemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: actionColor.withOpacity(0.37),
              ),
              color: themeNotifier.isDark ? Colors.white : Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.28),
                  blurRadius: 30,
                )
              ],
            ),
          ),
          headerBuilder: (context, extended) {
            return SvgPicture.string(logo);
          },
          items: const [
            SidebarXItem(
              icon: Icons.home,
              label: 'Home',
            ),
            SidebarXItem(
              icon: Icons.settings,
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
