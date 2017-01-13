//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by 서석인 on 1/11/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var distortionButton: UIButton!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var sliderValue: UISlider!
    
    enum ButtonType: Int { case slow=0, fast, chipmunk, vader, echo, reverb, play, distortion }
    
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        print("play sound button pressed")
        switch( ButtonType(rawValue: sender.tag)!){
        case .slow:
            playSound(rate:1 - 0.5 * sliderValue.value)
        case .fast:
            playSound(rate:1 + 0.5 * sliderValue.value)
        case .chipmunk:
            playSound(pitch: 1000 * sliderValue.value)
        case .vader:
            playSound(pitch: -1000 * sliderValue.value)
        case .echo:
            playSound(echo: true, param: sliderValue.value)
        case .reverb:
            playSound(reverb: true, param: sliderValue.value)
        case .play:
            playSound(volume: true, param: sliderValue.value)
        case .distortion:
            playSound(distortion: true, param: sliderValue.value)
        }
        configureUI(.playing)
        print("sliderValue:",sliderValue.value)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        print("stop audio button pressed")
        stopAudio()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupAudio()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
