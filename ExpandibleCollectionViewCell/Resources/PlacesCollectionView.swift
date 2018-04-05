//
//  PlacesCollectionView.swift
//  ExpandibleCollectionViewCell
//
//  Created by Alejandro St on 24/03/18.
//  Copyright © 2018 Alejandro St. All rights reserved.
//

import UIKit

class PlacesCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var items = [Places]()
    var cellPosition = CGRect()
    var cellIsOpen = false
	let cellId = "cell"

	let collectionView : UICollectionView = {
		let menu = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: menu)
		cv.backgroundColor = UIColor.rgb(210, green: 210, blue: 210)
		cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		return cv
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		let place1: Places = {
			let pl = Places()
			pl.image = "IMG_001"
			pl.name = "Sesame snaps donut pudding sugar"
			pl.desc = "Cupcake dragée ice cream topping lollipop macaroon. Liquorice chocolate cake gummies topping ice cream lollipop sugar plum. Cotton candy danish halvah gummi bears chocolate cake sugar plum croissant cheesecake. "
			return pl
		}()
		let place2: Places = {
			let pl = Places()
			pl.image = "IMG_002"
			pl.name = "Liquorice chocolate cake"
			pl.desc = "Cupcake dragée ice cream topping lollipop macaroon. Liquorice chocolate cake gummies topping ice cream lollipop sugar plum. Cotton candy danish halvah gummi bears chocolate cake sugar plum croissant cheesecake. "
			return pl
		}()
		let place3: Places = {
			let pl = Places()
			pl.image = "IMG_003"
			pl.name = "Gummies topping ice cream"
			pl.desc = "Cupcake dragée ice cream topping lollipop macaroon. Liquorice chocolate cake gummies topping ice cream lollipop sugar plum. Cotton candy danish halvah gummi bears chocolate cake sugar plum croissant cheesecake. "
			return pl
		}()
		let place4: Places = {
			let pl = Places()
			pl.image = "IMG_004"
			pl.name = "Cupcake dragée ice cream"
			pl.desc = "Cupcake dragée ice cream topping lollipop macaroon. Liquorice chocolate cake gummies topping ice cream lollipop sugar plum. Cotton candy danish halvah gummi bears chocolate cake sugar plum croissant cheesecake. "
			return pl
		}()
		let place5: Places = {
			let pl = Places()
			pl.image = "IMG_005"
			pl.name = "Topping lollipop macaroon."
			pl.desc = "Cupcake dragée ice cream topping lollipop macaroon. Liquorice chocolate cake gummies topping ice cream lollipop sugar plum. Cotton candy danish halvah gummi bears chocolate cake sugar plum croissant cheesecake. "
			return pl
		}()
		
		items.append(place1)
		items.append(place2)
		items.append(place3)
		items.append(place4)
		items.append(place5)
		
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
		return items.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlacesCell
		
		let item = items[indexPath.item]
		
		cell.closeBtn.isHidden = true
		cell.placeTitle.text = item.name
		cell.placeDesc.text = item.desc
		cell.placeContent.isHidden = true
		cell.placeImage.image = UIImage(named: item.image!)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: 200)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 16
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if cellIsOpen {
			return
		}
		
		cellIsOpen = true
		
		let cell = collectionView.cellForItem(at: indexPath) as! PlacesCell
		
		cell.superview?.bringSubview(toFront: cell)
		
		cell.placeContent.alpha = 0;
		cell.placeContent.isHidden = false
		
		cellPosition = cell.frame
		
		UIView.animate(
			withDuration: 0.8
			, delay: 0
			, usingSpringWithDamping: 0.5
			, initialSpringVelocity: 1
			, options: .curveEaseInOut
			, animations: {
				
					collectionView.isScrollEnabled = false
					cell.placeImage.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 300)
					cell.frame =   collectionView.bounds
				
				
			}) {_ in
				
				cell.closeBtn.isHidden = false
				cell.closeBtn.tag = indexPath.item
				cell.closeBtn.addTarget(self, action: #selector(self.closePlaceDetails), for: .touchUpInside)
				
				cell.placeDesc.sizeToFit()
				
				UIView.animate(
					withDuration: 1
					, delay: 0
					, usingSpringWithDamping: 1
					, initialSpringVelocity: 1
					, options: .curveEaseInOut
					, animations: {
				
						cell.placeContent.alpha = 1;
					})
			}
	}
	
	@objc func closePlaceDetails(sender: UIButton)
	{
		
		let indexPath = NSIndexPath(row: sender.tag, section: 0) as IndexPath
		let cell = collectionView.cellForItem(at: indexPath) as! PlacesCell
		
		cell.placeContent.alpha = 0
		cell.closeBtn.isHidden = true
		
		cellIsOpen = false
		
		UIView.animate(
			withDuration: 0.8
			, delay: 0
			, usingSpringWithDamping: 0.7
			, initialSpringVelocity: 1
			, options: .curveEaseInOut
			, animations: {
				
					self.collectionView.isScrollEnabled = true
					cell.placeImage.frame = CGRect(x: 0, y: 0, width: self.collectionView.frame.width, height: 150)
					cell.frame =   self.cellPosition
				
				
			}) {_ in
			
				self.collectionView.isScrollEnabled = true
				self.collectionView.reloadItems(at: [indexPath])
				
				
			}
		
		
		
		
	}
}
