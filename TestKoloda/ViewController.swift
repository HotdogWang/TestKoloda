//
//  ViewController.swift
//  TestKoloda
//
//  Created by Hotdog on 2017/8/13.
//  Copyright © 2017年 Hotdog. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController {
    @IBOutlet weak var kolodaView: KolodaView!

    override func viewDidLoad() {
        super.viewDidLoad()
        kolodaView.countOfVisibleCards = 1
        kolodaView.dataSource = self
        kolodaView.delegate = self
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func left(_ sender: Any) {
        kolodaView?.swipe(.left)
    }

    @IBAction func right(_ sender: Any) {
        kolodaView?.swipe(.right)
    }
}

extension ViewController : KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return 5
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let finalView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        finalView.backgroundColor = .blue
        return finalView
    }
    
}

extension ViewController : KolodaViewDelegate {
    func koloda(koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print("indexxx \(index)    direction\(direction)")
    }
}
