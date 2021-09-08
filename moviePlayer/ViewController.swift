//
//  ViewController.swift
//  moviePlayer
//
//  Created by  Alvie on 2021/9/8.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var moviePageControl: UIPageControl!
    @IBOutlet weak var movieSegment: UISegmentedControl!
    @IBOutlet weak var movieLabel: UILabel!
    
    //運用陣列
    let movieImages = ["愛在1","愛在2","愛在3"]
    let movieLabels = ["「我們所做的一切，到了最後，不都是為了要讓自己能被多愛一點嗎？」","「孤單一人總好過在愛人身邊感到寂寞。」","「如果你想要真愛，這就是了。這就是現實，它並不完美，但很真實。」"]
    //定義變數 顯示陣列的排序
    var selectNumber : Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        syncChange()
    }
    //同步改變
    func syncChange() {
        movieImageView.image = UIImage(named: movieImages[selectNumber])
        movieLabel.text = movieLabels[selectNumber]
        moviePageControl.currentPage = selectNumber
        movieSegment.selectedSegmentIndex = selectNumber
    }
    
    //pageControl
    @IBAction func pageChange(_ sender: UIPageControl) {
        selectNumber = sender.currentPage
        if moviePageControl.currentPage == 0 {
            selectNumber = 0
            syncChange()
        }else if moviePageControl.currentPage == 1 {
            selectNumber = 1
            syncChange()
        }else{
            selectNumber = 2
            syncChange()
        }
    }
    
    //segmentedControl
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        
        selectNumber = sender.selectedSegmentIndex
        if movieSegment.selectedSegmentIndex == 0 {
            selectNumber = 0
            syncChange()
        }else if movieSegment.selectedSegmentIndex == 1 {
            selectNumber = 1
            syncChange()
        }else{
            selectNumber = 2
            syncChange()
        }
    }
    
    //前一頁、上一頁
    @IBAction func prev(_ sender: UIButton) {
        if selectNumber == 0 {
            selectNumber = movieImages.count-1
        }else{
            selectNumber -= 1
        }
        syncChange()
    }
    
    
    @IBAction func next(_ sender: UIButton) {
        if selectNumber == movieImages.count-1 {
            selectNumber = 0
        }else{
            selectNumber += 1
        }
        syncChange()
    }
    
    
    @IBAction func swipeCgangePage(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            selectNumber += 1
            if selectNumber == 0 {
                sync()
            } else if selectNumber == 1 {
                sync()
            } else if selectNumber == 2 {
                sync()
            } else {
                selectNumber = 0
                sync()
            }
        } else if sender.direction == .right {
            selectNumber -= 1
            if selectNumber == 2 {
                sync()
            } else if selectNumber == 1 {
                sync()
            } else if selectNumber == 0 {
                sync()
            } else {
                selectNumber = 2
                sync()
            }
        }
        
    }
    


}

