class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      rating: map['rating'],
      comment: map['comment'],
      date: DateTime.parse(map['date']),
      reviewerName: map['reviewerName'],
      reviewerEmail: map['reviewerEmail'],
    );
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review.fromMap(json);
  }

  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }
}
