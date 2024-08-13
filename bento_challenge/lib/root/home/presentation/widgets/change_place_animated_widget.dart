import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/product/presentation/views/product_details_view.dart';
import 'package:bento_challenge/root/home/presentation/controllers/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChangePlaceAnimatedWidget extends StatefulWidget {
  const ChangePlaceAnimatedWidget({
    super.key,
  });

  @override
  State<ChangePlaceAnimatedWidget> createState() => _ChangePlaceAnimatedWidgetState();
}

class _ChangePlaceAnimatedWidgetState extends State<ChangePlaceAnimatedWidget> with SingleTickerProviderStateMixin {
  final HomeViewController _homeViewController = Modular.get();

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 300),
    );

    _heightAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const MyElasticOutCurve(0.7),
    );

    _arrowAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _toggleOverlay() {
    if (_overlayEntry == null) {
      _createOverlayEntry();
    } else {
      _removeOverlay();
    }
  }

  void _createOverlayEntry() {
    final selectedCity = _homeViewController.selectedCity.value;
    final citiesToShow = _homeViewController.cities.where((city) => city != selectedCity).toList();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 150,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 20),
          child: Material(
            color: Colors.transparent,
            child: FadeTransition(
              opacity: _heightAnimation,
              child: SizeTransition(
                sizeFactor: _heightAnimation,
                child: Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var city in citiesToShow)
                          GestureDetector(
                            onTap: () {
                              _homeViewController.setSelectedCity(city);
                              _removeOverlay();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: UIText(
                                city,
                                fontWeight: FontWeight.w500,
                                color: UIColors.baliHai,
                              ),
                            ),
                          ),
                        const Divider(
                          color: UIColors.alabaster,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: UIColors.blueZodiac,
                                size: 14,
                              ),
                              SizedBox(width: 8),
                              UIText(
                                'Favorite Place',
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  void _removeOverlay() {
    _animationController.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Row(
        children: [
          ValueListenableBuilder(
              valueListenable: _homeViewController.selectedCity,
              builder: (context, selectedPlace, _) {
                return GestureDetector(
                  onTap: _toggleOverlay,
                  child: UIText(
                    selectedPlace,
                    color: UIColors.baliHai,
                    fontWeight: FontWeight.w700,
                  ),
                );
              }),
          GestureDetector(
            onTap: _toggleOverlay,
            child: RotationTransition(
              turns: _arrowAnimation,
              child: const Padding(
                padding: UIPaddings.onlyLeft4,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: UIColors.blueZodiac,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
