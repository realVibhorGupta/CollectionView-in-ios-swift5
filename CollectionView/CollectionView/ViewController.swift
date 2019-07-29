//
//  ViewController.swift
//  CollectionView
//
//  Created by Vibhor Gupta on 8/20/18.
//  Copyright © 2018 Vibhor Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBAction func addItem() {
        let text = "\(collectionData.count + 1)"
        collectionData.append(text)
        let index = IndexPath(row: collectionData.count - 1 , section: 0)
        collectionView.insertItems(at: [index])
    }

    @objc func refresh(){
        addItem()
        collectionView.refreshControl?.endRefreshing()

    }



    @IBOutlet weak var collectionView: UICollectionView!

    var collectionData = [ "1 " , "2" ,"3" , "4" , "5" , "6" , "7" , "8" , "9" ,"10" ,"11" ,"12"]


    override func viewDidLoad() {
        super.viewDidLoad()


        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh), for: UIControl.Event.valueChanged)
        collectionView.refreshControl = refresh


        let width  = (view.frame.size.width - 20 ) / 3
        let layout  = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        layout.itemSize = CGSize(width: width, height: width)


        navigationItem.leftBarButtonItem = editButtonItem




    }


    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)


        addButton.isEnabled = false
        let indexes = collectionView.indexPathsForVisibleItems
        collectionView.allowsMultipleSelection = editing
        for index in indexes {
            let cell = collectionView.cellForItem(at: index) as! CollectionViewCell
            cell.isEditing = editing
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "DetailSegue"{
            if let destination = segue.destination as? DetailsViewController  ,
                let index = collectionView.indexPathsForSelectedItems?.first{

                destination.selection = collectionData[index.row]
            }
        }

    }

}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource {

    //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {


        return collectionData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell



        cell.titleLable.text = collectionData[indexPath.row]
        cell.isEditing = isEditing



        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let text = collectionData[indexPath.row]
        //        print(text)
//        if !isEditing {
//
//            performSegue(withIdentifier: "DetailSegue", sender: indexPath)
//        }
    }


}
