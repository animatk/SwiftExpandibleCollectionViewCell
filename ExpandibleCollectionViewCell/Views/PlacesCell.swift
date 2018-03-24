//
//  PlacesCell.swift
//  ExpandibleCollectionViewCell
//
//  Created by Alejandro St on 24/03/18.
//  Copyright © 2018 Alejandro St. All rights reserved.
//

import UIKit

class PlacesCell: UICollectionViewCell {
	
    override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView();
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let placeImage: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
		im.backgroundColor = .lightGray
        return im
    }()
	
    let placeContent : UIView = {
		let vi = UIView()
		vi.backgroundColor = .white
    	return vi
	}()
	
    func setupView() {
		
		addSubview(placeImage)
		addSubview(placeContent)
		
		addConstraintsWithFormat("H:|-[v0]-|", views: placeImage)
		addConstraintsWithFormat("H:|-[v0]-|", views: placeContent)
		addConstraintsWithFormat("V:|-[v0(150)][v1]-|", views: placeImage, placeContent)
		
	}
}
