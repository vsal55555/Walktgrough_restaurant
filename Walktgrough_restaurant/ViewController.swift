//
//  ViewController.swift
//  Walktgrough_restaurant
//
//  Created by BSAL-MAC on 6/27/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var imgView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
     
    private var titlelbl: UILabel = {
        let lbl1 = UILabel()
        lbl1.textAlignment = .center
        lbl1.text = "hello first title"
        lbl1.textColor = .red
        lbl1.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        lbl1.numberOfLines = 0
        
        print("I'm in title label obj")
        return lbl1
    }()
    
     private var bodylbl: UILabel = {
           let lbl2 = UILabel()
           lbl2.translatesAutoresizingMaskIntoConstraints = false
           lbl2.textAlignment = .center
           lbl2.text = "hello second title"
           lbl2.font = UIFont.systemFont(ofSize: 17, weight: .medium)
           lbl2.textColor = .red
           lbl2.numberOfLines = 0
           lbl2.lineBreakMode = .byWordWrapping
        print("I'm in body label obj")
        return lbl2
       }()

    private var pageControl: UIPageControl = {
           let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.pageIndicatorTintColor = .black
        pc.currentPageIndicatorTintColor = .lightGray
        return pc
    }()
    
    private lazy var nextButton: UIButton = {
       let btn = UIButton()
        btn.adjustsImageSizeForAccessibilityContentSizeCategory = false
        btn.setTitle("Next", for: .normal)
        btn.backgroundColor = .red
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        btn.addTarget(self, action: #selector(self.nextButtonPress), for: .touchUpInside)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    //dictonary inside array and string inside dictonary
    var data: [[String: String]] = [["image":"delivery1.png", "title":"Fast Shipping", "body":"Set your location to start exploring resturant around you"],
    ["image":"delivery2.png", "title":"Varity of Food", "body":"Order your favorite dessert and snacks anytime anywhere"],
    ["image":"delivery3.png", "title":"Order your favorite food", "body":"Find and order your favorite food and delivery to your home"]]
    
    var row: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //setupConstraint()
        print("I'm in load data function")
        pageControl.numberOfPages = data.count
        loadData(selectedRow: row)
        //view.backgroundColor = .red
    }
    
     func setupView() {
        view.backgroundColor = .white
        view.addSubview(imgView)
        view.addSubview(titlelbl)
        view.addSubview(bodylbl)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        setupConstraint()
        
        
    }
    
    func setupConstraint() {
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imgView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        print("I'm in title constraint")
        titlelbl.translatesAutoresizingMaskIntoConstraints = false
        titlelbl.topAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
        titlelbl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titlelbl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titlelbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        print("I'm in body title constraint")
        //bodylbl.translatesAutoresizingMaskIntoConstraints = false
        bodylbl.topAnchor.constraint(equalTo: titlelbl.bottomAnchor, constant: 10).isActive = true
        bodylbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        bodylbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        bodylbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30).isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //loadData()
    }
    
    @objc fileprivate func nextButtonPress(){
        
        if row == data.count - 1{
            nextButton.setTitle("Finish", for: .normal)
        }
        if row < data.count {
            hideAnimation()
            loadData(selectedRow: row)
        } else {
            row = 0
        }
        
        
    }
    func loadData(selectedRow: Int){
        imgView.image = UIImage(named: data[selectedRow]["image"]!)
        print("I'm in title load data")
        titlelbl.text = data[selectedRow]["title"]
        print("I'm in body load data")
        bodylbl.text = data[selectedRow]["body"]
        pageControl.currentPage = row
        row += 1
        showAnimation()
    }
    
    func showAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            //animation location start from view width
            self.titlelbl.transform = CGAffineTransform(translationX: self.view.frame.size.width, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                //titlelabl is in its original location
                self.titlelbl.alpha = 1
                self.titlelbl.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            //animation location start from view width aka jaba complete huncha
            self.bodylbl.transform = CGAffineTransform(translationX: self.view.frame.size.width, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                //titlelabl is in its original location
                self.bodylbl.alpha = 1
                self.bodylbl.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    func hideAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.titlelbl.alpha = 0
        })
    }
}

