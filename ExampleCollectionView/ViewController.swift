//
//  ViewController.swift
//  ExampleCollectionView
//
//  Created by Antoni Wiguna on 17/07/20.
//  Copyright © 2020 aiwiguna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	var gridData: [UIImage?] = []
	
	var tableData: [String] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.dataSource = self
		collectionView.delegate = self
		
		for i in 0...20 {
			tableData.append("\(i)")
			gridData.append(UIImage(systemName: "snow"))
			gridData.append(UIImage(systemName: "pencil"))
			gridData.append(UIImage(systemName: "trash"))
		}
		// Do any additional setup after loading the view.
	}
	
	
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		switch indexPath.section {
		case 0:
			return CGSize(width: collectionView.frame.width, height: 60)
		case 1:
			let numOfColumn = 4
			var spacing: CGFloat = 0
			
			if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
				spacing = flowLayout.minimumInteritemSpacing
			}
			
			let availableWidth: CGFloat = collectionView.bounds.width - (CGFloat(numOfColumn-1)*spacing)
			let cellWidth = availableWidth/CGFloat(numOfColumn)
			
			return CGSize(width: cellWidth, height: cellWidth)
		default:
			return .zero
		}
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch section {
		case 0:
			return tableData.count
		case 1:
			return gridData.count
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.section == 0 {
			let data = tableData[indexPath.row]
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCell", for: indexPath) as! TableCollectionViewCell
			cell.tableLabel.text = data
			cell.backgroundColor = .cyan
			return cell
		} else {
			let data = gridData[indexPath.row]
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCollectionViewCell
			cell.gridImage.image = data
			cell.backgroundColor = .lightGray
			return cell
		}
	}
	
	
}

