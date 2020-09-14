protocol WinLoss {
    var wins: Int { get }
    var losses: Int { get }
    // uncomment this sometime when you build to see what happens to miamiTuples
    //var winningPercentage: Double  { get }
}

extension WinLoss {
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses)
    }
}

struct CricketRecord: WinLoss {
    var wins: Int
    var losses: Int
    var draws: Int

    var winningPercentage: Double {
        Double(wins) / Double(wins + losses + draws)
    }
}

let miamiTuples = CricketRecord(wins: 8, losses: 7, draws: 1)
let winLoss: WinLoss = miamiTuples

// This is because winLoss constant evaluates to something that is WinLoss and not a CricketRecord
miamiTuples.winningPercentage // 0.5
winLoss.winningPercentage // 0.53 !!!


// That's how we use POP
protocol TeamRecord {
    var wins: Int { get }
    var losses: Int { get }
    var winningPercentage: Double { get }
}

extension TeamRecord {
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses)
    }
}

extension TeamRecord where Self: Tieable {
    var winningPercentage: Double {
        Double(wins) / Double(wins + losses + ties)
    }
}

protocol PostSeasonEligible {
    var minimumWinsForPlayoffs: Int { get }
}

extension TeamRecord where Self: PostSeasonEligible {
    var isPlayoffEligible: Bool {
        wins > minimumWinsForPlayoffs
    }
}

struct RugbyRecord: TeamRecord, Tieable {
    var wins: Int
    var losses: Int
    var ties: Int
}

let rugbyRecord = RugbyRecord(wins: 8, losses: 7, ties: 1)
rugbyRecord.winningPercentage // 0.5

protocol Tieable {
    var ties: Int { get }
}

protocol DivisionalRecord {
  var divisionalWins: Int { get }
  var divisionalLosses: Int { get }
}

protocol ScoreableRecord {
  var totalPoints: Int { get }
}

extension ScoreableRecord where Self: Tieable, Self: TeamRecord {
  var totalPoints: Int {
    (2 * wins) + (1 * ties)
  }
}

struct NewHockeyRecord: TeamRecord, Tieable,
       DivisionalRecord, CustomStringConvertible, Equatable {
  var wins: Int
  var losses: Int
  var ties: Int
  var divisionalWins: Int
  var divisionalLosses: Int

  var description: String {
    "\(wins) - \(losses) - \(ties)"
  }
}
