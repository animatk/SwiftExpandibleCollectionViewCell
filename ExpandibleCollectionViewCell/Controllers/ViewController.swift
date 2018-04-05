//
//  ViewController.swift
//  ExpandibleCollectionViewCell
//
//  Created by Alejandro St on 24/03/18.
//  Copyright © 2018 Alejandro St. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		view.backgroundColor = UIColor.rgb(200, green: 230, blue: 255)
		
		setupView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	let placesCollecion = PlacesCollectionView();
	
	func setupView()
	{
		view.addSubview( placesCollecion )
		
		view.addConstraintsWithFormat("H:|[v0]|", views: placesCollecion)
		view.addConstraintsWithFormat("V:|[v0]|", views: placesCollecion)
	}

}

