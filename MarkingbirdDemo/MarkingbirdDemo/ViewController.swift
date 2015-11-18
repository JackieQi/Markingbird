//
//  ViewController.swift
//  MarkingbirdDemo
//
//  Created by Jackie Qi on 11/17/15.
//  Copyright © 2015 jackie. All rights reserved.
//

import UIKit
import Markingbird

class ViewController: UIViewController {

  @IBOutlet weak var viewHtml: UIButton!
  @IBOutlet weak var markdownEditorView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    do {
      markdownEditorView.text = try NSString(contentsOfFile: NSBundle.mainBundle().pathForResource("Example", ofType: "md")!, encoding: NSUTF8StringEncoding) as String
    }
    catch {
      
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func convertHtml() -> String {
    let markdownText = markdownEditorView.text;
    
    var options = MarkdownOptions()
    options.autoHyperlink = true
    options.autoNewlines = true
    options.emptyElementSuffix = ">"
    options.encodeProblemUrlCharacters = true
    options.linkEmails = false
    options.strictBoldItalic = true
    
    //var markdownWithOption = Markdown(options: options)
    var markdown = Markdown()
    
    let fancyHtml = markdown.transform(markdownText)
    print("Converted to this HTML: \(fancyHtml)")
    return fancyHtml
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "presentLiveView" {
      let destination = segue.destinationViewController
      let liveViewController = destination as! LiveOutputViewController
      

      liveViewController.html = self.convertHtml()
    }
    
  }
}

