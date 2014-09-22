Feature: 戦闘

  Scenario: 柔い敵と戦闘
    Given "スライム" が現れた!
    When 勇者の攻撃!
    Then モンスターを倒した

  Scenario: 固い敵と戦闘
    Given "はぐれメタル" が現れた!
    When 勇者の攻撃!
    Then モンスターを倒せなかった
