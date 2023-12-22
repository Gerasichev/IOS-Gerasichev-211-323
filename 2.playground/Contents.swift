//Завершите функцию суммы квадратов так, чтобы она возводила в квадрат каждое переданное в нее число, а затем суммировала результаты.


import UIKit

func squareSum(_ vals: [Int]) -> Int {
    
    var res = vals.map{$0 * $0}
    
    return res.reduce(0, +)
}


print(squareSum([3, 4, 5]))
