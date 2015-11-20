//
//  AnswerListViewController.swift
//  iQuiz
//
//  Created by Jooneil Ahn on 11/12/15.
//  Copyright © 2015 Jooneil Ahn. All rights reserved.
//

import UIKit

class AnswerListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var question = Dictionary<String, AnyObject>()
    var questions = [Dictionary<String, AnyObject>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quizCell") as! quizCell
        let answerArray = self.question["answers"] as! NSArray
        cell.answerTitle.text = (answerArray[indexPath.row] as! String)
        cell.answerIndex = indexPath.row
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "goToResult" {
            let view = segue.destinationViewController as! AnswerViewController
            let cell = sender as! quizCell
            view.question = question
            let answerArray = self.question["answers"] as! NSArray
            view.given = answerArray[cell.answerIndex] as! String
            view.questions = questions
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
