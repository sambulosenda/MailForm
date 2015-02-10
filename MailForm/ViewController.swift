//
//  ViewController.swift
//  MailForm
//
//  Created by Sambulo Senda on 10/02/2015.
//  Copyright (c) 2015 Sambulo Senda. All rights reserved.
//

import UIKit
import MessageUI // allows you to perform some tasks

class ViewController: UIViewController , MFMailComposeViewControllerDelegate{

    @IBOutlet weak var Subject: UITextField!
    @IBOutlet weak var Body: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        superclass
    }


    @IBAction func SendEmail(sender: AnyObject) {
        var SubjectText = "This is Sambulo"
        SubjectText += Subject.text
        
        var MessageBody = Body
        
        var toRecipients = ["sambulosenda@gmail.com"]
        
        var mc : MFMailComposeViewController = MFMailComposeViewController()
        mc.setSubject(SubjectText)
        mc.setMessageBody(MessageBody.text, isHTML: false)
        mc.setToRecipients(toRecipients)
        
        self.presentViewController(mc, animated: true, completion: nil)
    }
    
    // Fix the send and cancel from the user.
    
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        switch result.value{
            
            
            case MFMailComposeResultCancelled.value:
            NSLog("Mail Cancelled")
            
        case MFMailComposeResultSaved.value:
            NSLog("Mail Saved")
            
        case MFMailComposeResultSent.value:
            NSLog("Mail Sent")
            
        case MFMailComposeResultFailed.value:
            NSLog("Mail Sent Failure: %@",[error.localizedDescription])
        default:
            break
        
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}

