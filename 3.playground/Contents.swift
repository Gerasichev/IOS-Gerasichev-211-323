//Прыгающее число — это число, все соседние цифры которого в нем отличаются на 1 .

import UIKit

func jumpingNumber(_ number: Int) -> String {
    
    let arrOfDigits = String(number).compactMap{Int(String($0))}
    
    for i in 0..<arrOfDigits.count - 1 {
            if abs(arrOfDigits[i] - arrOfDigits[i + 1]) != 1 {
                return "Not!!"
            }
    }
    
    return "Jumping!!"
}

print(jumpingNumber(123))
