//В этом ката вам нужно просто определить, является ли данный год високосным или нет. Если вы не знаете правил, вот они:
//
//Годы, кратные 4, являются високосными,
//но годы, кратные 100, не являются високосными,
//но годы, делящиеся на 400, являются високосными.
//Годы испытаний находятся в пределах допустимого 1600 ≤ year ≤ 4000.


import UIKit

func isLeapYear(_ year: Int) -> Bool {
    
    var res:Bool = false
    
    if year % 4 == 0{
        res = true
    }
    
    if year % 100 == 0{
        res = false
    }
    
    if year % 400 == 0{
        res = true
    }
    
  return res
}

