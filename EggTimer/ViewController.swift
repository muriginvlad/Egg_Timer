import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    
    let eggTime = ["Soft": 360 ,"Medium": 420 , "Hard": 720]
    var secondsRemaining = 60
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    
    @objc func updateCounter() {
        
        if secondsRemaining > 4 {
            label.text = "Осталось \(secondsRemaining) секунд"
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        }else if secondsRemaining > 0 {
            label.text = "Осталось \(secondsRemaining) секунды"
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        }else {
            timer.invalidate()
            label.text = " Готово!"
        }
    }
    
    
}




