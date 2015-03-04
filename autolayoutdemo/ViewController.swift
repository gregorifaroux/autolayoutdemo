//
//  ViewController.swift
//  autolayoutdemo
//
//  Created by Gregori Faroux on 11/3/14.
//  Copyright (c) 2014 digistarters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var view_constraint_V:NSArray = [];
    var originalValue:CGFloat = 0.0;
    var offsetValue:CGFloat = -200;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var topView = UIView()
        topView.setTranslatesAutoresizingMaskIntoConstraints(false)
        topView.backgroundColor = UIColor.blackColor()
        
        var bottomView = UIView()
        bottomView.setTranslatesAutoresizingMaskIntoConstraints(false)
        bottomView.backgroundColor = UIColor.lightGrayColor()
        
        self.view.addSubview(topView);
        self.view.addSubview(bottomView);
        
        let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 100, 100, 50)
        button.backgroundColor = UIColor.whiteColor()
        button.setTitle("Click me!", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        bottomView.addSubview(button)
        
        // constraints
        let viewsDictionary = ["top":topView,"bottom":bottomView]
        
        //position constraints
        let view_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[top]-10-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view_constraint_H2:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[bottom]-10-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        view_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[top(bottom)]-[bottom]-10-|", options: NSLayoutFormatOptions.AlignAllLeading, metrics: nil, views: viewsDictionary)
        
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_H2)
        view.addConstraints(view_constraint_V)
        
        originalValue = (view_constraint_V[1] as NSLayoutConstraint).constant;

    }
    
    /**
        Example of dynamically changing the constraints when clicking on a button.
    */
    func buttonAction(sender:UIButton!)
    {
        if ((view_constraint_V[1] as NSLayoutConstraint).constant == offsetValue) {
            (view_constraint_V[1] as NSLayoutConstraint).constant = originalValue
        } else {
            (view_constraint_V[1] as NSLayoutConstraint).constant = offsetValue
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

