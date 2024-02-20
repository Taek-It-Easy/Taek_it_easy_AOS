class BadgeItem {
  final int badgeIdx;
  final String content;
  final bool? success;

  BadgeItem({required this.badgeIdx, required this.content, this.success});

  factory BadgeItem.fromJson(Map<String, dynamic> json) {
    return BadgeItem(
      badgeIdx: json['badgeIdx'] as int,
      content: json['content'] as String,
    );
  }
}
