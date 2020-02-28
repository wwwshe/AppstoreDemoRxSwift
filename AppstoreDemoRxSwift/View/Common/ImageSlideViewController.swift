//
//  ImageSlideViewController.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/28.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ImageSlideViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var images = [String]()
    let disposeBag = DisposeBag()
    let buttonItem = UIBarButtonItem(title: "확인", style: .plain, target: self, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        rxSetView()
        
        
    }
    
    func setNavigationBar(){
        self.title = ""
        self.navigationItem.rightBarButtonItem = buttonItem
        self.navigationItem.hidesBackButton = true
     }
    
    
    func rxSetView(){
        Observable.from(optional: images).bind(to: collectionView.rx.items(cellIdentifier: ImageCollectionViewCell.reuseCellName, cellType: ImageCollectionViewCell.self)) { row, data, cell in
            
            let screenshotUrl = URL(string : data)
            cell.imageView.kf.setImage(with: screenshotUrl)
            
        }.disposed(by: disposeBag)
        
        collectionView.rx.setDelegate(self).disposed(by : disposeBag)

        buttonItem.rx.tap.subscribe { _ in
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
    }
    
}


extension ImageSlideViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cellWidth = (width - 30)
        return CGSize(width: cellWidth, height: collectionView.frame.height)
    }
}
