//
//  ChattingViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/14.
//

import UIKit
private let reuseIdentifier = "ChattingCell"
class ChattingViewController: UIViewController {
    let chattingView = ChattingView()
    var mockData = ChatList.mockData
   
    convenience init(title: String) {
        self.init()
        self.title = title
    }
    
    override func loadView() {
        self.view = chattingView
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chattingView.collectionView.dataSource = self
        chattingView.collectionView.delegate = self
        
        
    }
}

extension ChattingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ChatList.mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChattingCell
        cell.contentLabel.text = mockData[indexPath.row].content
        cell.nameLabel.text = mockData[indexPath.row].name
        cell.dateLabel.text = "\(mockData[indexPath.row].date)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        return CGSize(width: chattingView.safeAreaLayoutGuide.layoutFrame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
}

