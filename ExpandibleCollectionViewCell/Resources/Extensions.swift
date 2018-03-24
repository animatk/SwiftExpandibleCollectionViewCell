//
//  Extensions.swift
//  ExpandibleCollectionViewCell
//
//  Created by Alejandro St on 24/03/18.
//  Copyright © 2018 Alejandro St. All rights reserved.
//

import UIKit


extension UIColor{
	//se crea esta extencion para facilitar la asignacion de colores a los textos
	static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat , alpha: CGFloat = 1) -> UIColor{
		return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha);
	}
}

extension UIView{
	//extersion creada para limpiar y optimizar el proceso de asignar constraints
	//cada UIview creada necesita adaptarse mediante constraints pero la creacion de estos puede simplificarse mendiante esta extension
	func addConstraintsWithFormat(_ format : String, views : UIView...){
		//como el listado de views es un listado separado por comas vamos a recorrerlo para crear un diccionario (arreglo) y declarar las keys
		var viewsDictionary = [String: UIView]()
		for(index, view) in views.enumerated(){
			let key = "v\(index)"
			viewsDictionary[key] = view
			view.translatesAutoresizingMaskIntoConstraints = false
		}
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
	
	}
}
