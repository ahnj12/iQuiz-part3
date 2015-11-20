//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Jooneil Ahn on 11/19/15.
//  Copyright © 2015 Jooneil Ahn. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var urlText: UITextField!
    
    @IBOutlet weak var status: UILabel!
    var newQuiz = [Dictionary<String, AnyObject>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.urlText.text = "http://tednewardsandbox.site44.com/questions.json"
        self.status.text = ""
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recrvared.
    }
    
    @IBAction func downloadQuestions(sender: AnyObject) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    
        let URL = NSURL(string: self.urlText.text!)
        
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            
            print("URL session Task succeeded: \(statusCode)")
            
            do {
                self.newQuiz = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [Dictionary<String, AnyObject>]
                
                self.status.text = "downloaded successfully"
                
                let defaults = NSUserDefaults.standardUserDefaults()
                defaults.setObject(self.newQuiz, forKey: "quizData")
                
                
            } catch {
                self.status.text = "download failed, failed to connect to internet"
                
            }
        }
        
        task.resume()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let mainController = segue.destinationViewController as! ViewController
        
        mainController.newQuizzes = self.newQuiz
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
