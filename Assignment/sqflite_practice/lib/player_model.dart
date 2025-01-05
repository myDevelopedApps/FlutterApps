
class player {
  final String playerName;
  final int jerNo;
  final int runs;
  final double average;

  player({
    required this.playerName,
    required this.jerNo,
    required this.runs,
    required this.average,
  });

  Map<String, dynamic> playerMap() {
    return {
      'playerName': playerName,
      'jerNo': jerNo,
      'runs': runs,
      'average': average,
    };
  }
}
