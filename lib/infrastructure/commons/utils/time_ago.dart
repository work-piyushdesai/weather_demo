class TimeAgo {
  static String timeAgoSinceDate(String dateString,
      {bool numericDates = true}) {
    DateTime notificationDate = DateTime.parse(dateString);
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);

    if (difference.inDays > 365) {
      return numericDates
          ? "${(difference.inDays / 365).floor()} ${(difference.inDays / 365).floor() == 1 ? "y" : "y"} "
          : "${(difference.inDays / 365).floor()} ${(difference.inDays / 365).floor() == 1 ? "year ago" : "years ago"} ";
    } else if (difference.inDays > 30) {
      return numericDates
          ? "${(difference.inDays / 30).floor()} ${(difference.inDays / 30).floor() == 1 ? "m" : "m"}"
          : "${(difference.inDays / 30).floor()} ${(difference.inDays / 30).floor() == 1 ? "month ago" : "months ago"}";
    } else if (difference.inDays > 7) {
      return numericDates
          ? '${(difference.inDays / 7).floor()}w'
          : '${(difference.inDays / 7).floor()} ${(difference.inDays / 7).floor() == 1 ? ' week ago' : 'weeks ago'}';
    }
    /*else if ((difference.inDays / 7).floor() >= 1) {
      return numericDates ? '1w' : '1 week ago';
    } */
    else if (difference.inDays >= 2) {
      return numericDates
          ? '${difference.inDays}d'
          : '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return numericDates ? '1d' : '1 day ago';
    } else if (difference.inHours >= 2) {
      return numericDates
          ? '${difference.inHours}h'
          : '${difference.inHours} hrs ago';
    } else if (difference.inHours >= 1) {
      return numericDates ? '1h' : '1 hr ago';
    } else if (difference.inMinutes >= 2) {
      return numericDates
          ? '${difference.inMinutes}mins'
          : '${difference.inMinutes} mins ago';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? '1min' : '1 min ago';
    } else if (difference.inSeconds >= 3) {
      return numericDates
          ? '${difference.inSeconds}sec'
          : '${difference.inSeconds} sec ago';
    } else {
      return 'Just now';
    }
  }
}
