import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    let eggTime = ["Soft": 360 ,"Medium": 420 , "Hard": 720]
    var secondsRemaining = 60
    var timer = Timer()
    
    var alarmSound = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    var audioPlayer = AVAudioPlayer()
    
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
        }else if secondsRemaining > 1 {
            label.text = "Осталось \(secondsRemaining) секунды"
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        }else if secondsRemaining > 0 {
            label.text = "Осталась \(secondsRemaining) секунда"
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        }else {
            timer.invalidate()
            alarmStart()
            label.text = " Готово!🎉"
        }
    }
    
    func alarmStart() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: alarmSound!)
            audioPlayer.play()
        } catch {
            print("couldn't load sound file")
        }
    }
}




