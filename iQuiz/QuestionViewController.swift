//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Jooneil Ahn on 11/11/15.
//  Copyright © 2015 Jooneil Ahn. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var questionTableView: UITableView!
    var questions = [Dictionary<String, AnyObject>]()
    var correctAnswer = String()
    var theQuestion = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTableView.reloadData()


        // Do any additional setup after loading the view.
    }
    
    func addToAnswer(sender: UIButton, qIndex:Int) {
        let tempAnswer = sender.titleLabel!.text
        self.performSegueWithIdentifier("goAnswers", sender: sender)
        sender.titleLabel!.text = tempAnswer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quizCell") as! quizCell
        let questionList = self.questions[indexPath.row]
        cell.questionTitle.text = (questionList["text"] as! String)
        cell.index = indexPath.row
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "goToAnswerList" {
            let view = segue.destinationViewController as! AnswerListViewController
            let cell = sender as! quizCell
            
            view.question = questions[cell.index]
            view.questions = questions
        } else {
            let view = segue.destinationViewController as! ViewController
            let defaults = NSUserDefaults.standardUserDefaults()
            if let quizData = defaults.arrayForKey("quizData")
            {
                view.newQuizzes = quizData as! [Dictionary<String, AnyObject>]
            }
            
        }
        
        
        
    }
    

}
