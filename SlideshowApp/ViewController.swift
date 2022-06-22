//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 越智三四郎 on 2022/06/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var modoru: UIButton!
    @IBOutlet weak var go: UIButton!
    
    var imageNames = [
        "takamiya.jpeg",
        "sakuragi.jpeg",
        "mitui.jpeg",]
    // タイマー
    var timer: Timer!
    
    
    var showindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showImage()
    }
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 2, repeats: true で指定された通り、2秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        // showIndexをカウントアップ
            showindex += 1
            // 最終番号を超えたら0に戻す
            if showindex >= imageNames.count {
              showindex = 0
            }
            // 画像表示
            showImage()
    }
   // 再生ボタン IBAction
    @IBAction func start(_ sender: Any) {
    // 再生ボタンを押すとタイマー作成、始動
        if timer == nil {
              // スライドショー開始
              timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
              // ボタンをスライドショー開始状態にする
              playButton.setTitle("停止", for: .normal)
              go.isEnabled = false
              modoru.isEnabled = false
            } else {
              // スライドショー停止
              timer.invalidate()
              timer = nil
              // ボタンをスライドショー停止状態にする
              playButton.setTitle("再生", for: .normal)
                go.isEnabled = true
                modoru.isEnabled = true
            }
        
        
    }
    // 画面遷移時の処理
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare is called.")
        // スライドショーを停止してから画面遷移する
        if timer != nil {
          // スライドショー停止
          timer.invalidate()
          timer = nil
          // ボタンをスライドショー停止状態にする
          playButton.setTitle("再生", for: .normal)
            go.isEnabled = true
            modoru.isEnabled = true
        }
        // 表示中の画像を引き継ぎ
        let secondViewController = segue.destination as! SecondViewController
        secondViewController.image = imageview.image
      }
   // 戻るボタン IBAction
    @IBAction func backButton(_ sender: Any) {
        // showIndexをカウントダウン
            showindex -= 1
            // 最初より前に戻ったら最終番号にする
            if showindex < 0 {
              showindex = imageNames.count - 1
            }
            // 画像表示
            showImage()
    }
   // 進むボタン IBAction
    @IBAction func susumu(_ sender: Any) {
        // showIndexをカウントアップ
            showindex += 1
            // 最終番号を超えたら0に戻す
            if showindex >= imageNames.count {
              showindex = 0
            }
            // 画像表示
            showImage()
        
    }
    // showIndexの画像を表示
      func showImage() {
        imageview.image = UIImage(named: imageNames[showindex])
      }

}
