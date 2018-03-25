//
//  PlacesCell.swift
//  ExpandibleCollectionViewCell
//
//  Created by Alejandro St on 24/03/18.
//  Copyright © 2018 Alejandro St. All rights reserved.
//

import UIKit

class PlacesCell: UICollectionViewCell {
	
	let closeBtn : UIButton = {
		let bt = UIButton()
		bt.setTitle("X", for: .normal)
		bt.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
		bt.backgroundColor = UIColor.rgb(100, green: 100, blue: 100, alpha: 0.5)
		bt.layer.cornerRadius = 13
		bt.isHidden = true
		return bt
	}()
	
	let placeImage: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFill
		im.backgroundColor = .lightGray
		im.layer.masksToBounds = true
		return im
    }()
	
    let placeContent : UIView = {
		let vi = UIView()
		vi.backgroundColor = .white
    	return vi
	}()
	
	let placeTitle: UILabel = {
		let lb = UILabel()
		lb.text = "Place name"
		lb.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
		return lb
	}()
	
	let placeDesc: UILabel = {
		let lb = UILabel()
		lb.text = "Description of place"
		lb.font = UIFont(name: "HelveticaNeue-Reguar", size: 16)
		lb.textColor = .gray
		lb.numberOfLines = 0
		lb.lineBreakMode = .byWordWrapping
		//lb.sizeToFit()
		return lb
	}()
	
	let optionsView = UIView()
	
	let option1 : UIButton = {
		let bt = UIButton()
		bt.setTitle("Reserve now", for: .normal)
		bt.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
		bt.layer.cornerRadius = 3
		bt.backgroundColor = UIColor.rgb(204, green: 102, blue: 255)
		bt.setTitleColor(.white, for: .normal)
		return bt
	}()
	
	let option2 : UIButton = {
		let bt = UIButton()
		bt.setTitle("Create reminder", for: .normal)
		bt.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
		bt.layer.cornerRadius = 4
		bt.backgroundColor = UIColor.rgb(217, green: 217, blue: 217)
		bt.setTitleColor(.black, for: .normal)
		return bt
	}()
	
	
    override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView();
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    func setupView() {
		
		backgroundColor  = .white
		
		addSubview(placeImage)
		addSubview(placeTitle)
		addSubview(placeContent)
		addSubview(closeBtn)
		
		addConstraintsWithFormat("H:|-20-[v0(25)]", views: closeBtn)
		addConstraintsWithFormat("V:|-20-[v0(25)]", views: closeBtn)
		
		addConstraintsWithFormat("H:|[v0]|", views: placeImage)
		addConstraintsWithFormat("H:|-16-[v0]-16-|", views: placeTitle)
		addConstraintsWithFormat("H:|-16-[v0]-16-|", views: placeContent)
		addConstraintsWithFormat("V:|[v0(>=150,<=300)]-10-[v1(>=20,<=30)]-16-[v2]|", views: placeImage, placeTitle, placeContent)
		
		
		placeContent.addSubview( placeDesc )
		placeContent.addSubview( optionsView )
		
		placeContent.addConstraintsWithFormat("H:|-[v0]-|", views: placeDesc)
		placeContent.addConstraintsWithFormat("H:|-[v0]-|", views: optionsView)
		placeContent.addConstraintsWithFormat("V:|[v0]-16-[v1]-|", views: placeDesc, optionsView)
		
		optionsView.addSubview(option1)
		optionsView.addSubview(option2)
		
		
		optionsView.addConstraintsWithFormat("H:|-[v0]-16-[v1(v0)]-|", views: option1, option2)
		optionsView.addConstraintsWithFormat("V:|-[v0(40)]-|", views: option1)
		optionsView.addConstraintsWithFormat("V:|-[v0(40)]-|", views: option2)
		
		
		
		
		
	}
}
