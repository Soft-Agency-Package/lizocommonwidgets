import 'package:flutter/material.dart';

class StarRatingComponent extends StatefulWidget {
  final int maxStars;
  final double initialRating;
  final double starSize;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<double>? onRatingChanged;
  final bool allowHalfRating;

  const StarRatingComponent({
    super.key,
    this.maxStars = 5,
    this.initialRating = 0.0,
    this.starSize = 24.0,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
    this.onRatingChanged,
    this.allowHalfRating = true,
  });

  @override
  State<StarRatingComponent> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRatingComponent> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxStars, (index) {
        return GestureDetector(
          onTap: () {
            if (widget.onRatingChanged != null) {
              setState(() {
                _rating = index + 1.0;
                widget.onRatingChanged!(_rating);
              });
            }
          },
          onHorizontalDragUpdate:
              widget.allowHalfRating
                  ? (details) {
                    if (widget.onRatingChanged != null) {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final localPosition = box.globalToLocal(
                        details.globalPosition,
                      );
                      final starWidth = box.size.width / widget.maxStars;
                      final pos = localPosition.dx / starWidth;

                      // Calculate the rating based on position
                      double newRating;
                      if (pos - pos.floor() < 0.5) {
                        newRating = pos.floor() + 0.5;
                      } else {
                        newRating = pos.floor() + 1.0;
                      }

                      // Ensure rating is within bounds
                      newRating = newRating.clamp(
                        0.0,
                        widget.maxStars.toDouble(),
                      );

                      if (_rating != newRating) {
                        setState(() {
                          _rating = newRating;
                          widget.onRatingChanged!(_rating);
                        });
                      }
                    }
                  }
                  : null,
          child: _buildStar(index),
        );
      }),
    );
  }

  Widget _buildStar(int index) {
    IconData iconData;
    Color color;

    if (index + 0.5 < _rating) {
      // Full star
      iconData = Icons.star_rate;
      color = widget.activeColor;
    } else if (index < _rating) {
      // Half star
      iconData = Icons.star_half;
      color = widget.activeColor;
    } else {
      // Empty star
      iconData = Icons.star;
      color = widget.inactiveColor;
    }

    return Icon(iconData, color: color, size: widget.starSize);
  }
}
