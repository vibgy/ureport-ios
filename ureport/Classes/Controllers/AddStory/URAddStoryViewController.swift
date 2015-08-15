//
//  URAddStoryViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 14/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URAddStoryViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtMarkers: UITextField!
    @IBOutlet weak var txtHistory: UITextView!
    @IBOutlet weak var btAddMarkers: UIButton!
    @IBOutlet weak var btAddMedia: UIButton!
    @IBOutlet weak var scrollViewMedias: UIScrollView!
    
    var imgCover: UIImage?
    let defaultText = "Tell us what's going on"
    let maxTitleLength = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //Mark: Button Events
    
    @IBAction func btSendHistoryTapped(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func btAddMarkersTapped(sender: AnyObject) {
        self.navigationController?.pushViewController(URMarkerTableViewController(), animated: true)
    }

    @IBAction func btAddMediaTapped(sender: AnyObject) {
    }
    
    //MARK: Class Methods
    
    private func setupUI() {
        self.txtHistory.text = defaultText
        self.txtHistory.textColor = UIColor.lightGrayColor()
    }
    
    //MARK: TextView Delegate
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.text == defaultText {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = defaultText
            textView.textColor = UIColor.lightGrayColor()
        }
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if textView == txtTitle{
            return count(textView.text) + (count(text) - range.length) <= maxTitleLength
        }else {
            return true
        }
    }
    
}
