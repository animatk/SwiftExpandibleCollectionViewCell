//
//  PlacesCollectionView.swift
//  ExpandibleCollectionViewCell
//
//  Created by Alejandro St on 24/03/18.
//  Copyright © 2018 Alejandro St. All rights reserved.
//

import UIKit

class PlacesCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let items = [Places]()
	let cellId = "cell"
	
	let collectionView : UICollectionView = {
		let menu = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: menu)
		cv.backgroundColor = UIColor.rgb(200, green: 230, blue: 255)
		cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		return cv
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		//setup collection view
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(PlacesCell.self, forCellWithReuseIdentifier: cellId)
		
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupView()
	{
		addSubview(collectionView)
		
		addConstraintsWithFormat("H:|[v0]|", views: collectionView)
		addConstraintsWithFormat("V:|[v0]|", views: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlacesCell
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: 200)
	}
}
