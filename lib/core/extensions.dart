import '../resource/strings.dart';

extension FeedbackRating on String {
  String getRating() {
    switch (this) {
      case Strings.star1:
        return '1/5';
      case Strings.star2:
        return '2/5';
      case Strings.star3:
        return '3/5';
      case Strings.star4:
        return '4/5';
      case Strings.star5:
        return '5/5';
      case Strings.na:
        return 'NA';
      default:
        return '';
    }
  }

  int getRatingInt() {
    switch (this) {
      case Strings.star1:
        return 1;
      case Strings.star2:
        return 2;
      case Strings.star3:
        return 3;
      case Strings.star4:
        return 4;
      case Strings.star5:
        return 5;
      case Strings.na:
        return 0;
      default:
        return -1;
    }
  }
}

extension Grade on double {
  String getGrade() {
    if (this <= 2) {
      return Strings.belowAverage;
    } else if (this <= 3) {
      return Strings.belowAverage;
    } else {
      return Strings.good;
    }
  }
}
