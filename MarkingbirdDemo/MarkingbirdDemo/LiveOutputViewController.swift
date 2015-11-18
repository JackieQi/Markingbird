//
//  LiveOutputViewController.swift
//  MarkingbirdDemo
//
//  Created by Jackie Qi on 11/17/15.
//  Copyright © 2015 jackie. All rights reserved.
//

import UIKit

class LiveOutputViewController: UIViewController {
  
  @IBOutlet weak var closeButton: UIButton!
  @IBOutlet weak var liveView: UITextView!
  
  internal var html : String?
//  init(html: String) {
//    self.html = html
//  }

//  init(html: String) {
//    self.html = html
//    super.init(nibName: nil, bundle: nil)
//  }

  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("html:\(html)")
    guard html != nil else {
      return
    }
    // Do any additional setup after loading the view, typically from a nib.
    let option = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]
    do {
      let attributedString = try NSAttributedString(data: (html?.dataUsingEncoding(NSUTF8StringEncoding))!, options: option, documentAttributes: nil)
      liveView.attributedText = attributedString
    } catch {
      liveView.text = html
    }

  }
  
  @IBAction func closeButtonClicked(sender: UIButton) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}