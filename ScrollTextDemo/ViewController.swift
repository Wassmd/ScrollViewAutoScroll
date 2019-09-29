//
//  ViewController.swift
//  ScrollTextDemo
//
//  Created by Mohammed Wasimuddin on 29.09.19.
//  Copyright © 2019 Wasim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.startAutomaticScrolling()
        }
        
    }
    
    func startAutomaticScrolling() {
        let bottomPoint = scrollView.contentSize.height - scrollView.bounds.height
        let animator = UIViewPropertyAnimator(duration: 10.0, curve: .easeIn) {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: bottomPoint), animated: false)
        }
        animator.startAnimation()
        
        animator.addCompletion { _ in self.scrollBackToTop() }
    }
    
    private func scrollBackToTop() {
        let scrollBackToTopAnimator = UIViewPropertyAnimator(duration: 10, curve: .easeIn) {
                   self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
                   
               }
        scrollBackToTopAnimator.startAnimation()
        
        scrollBackToTopAnimator.addCompletion { _ in self.startAutomaticScrolling()}
    }
}

