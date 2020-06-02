//
//  TrainingCoursesVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/7/20.
//  Copyright © 2020 rahma. All rights reserved.
//
struct Courses {
    var image: String?
    var title: String?
    var date: String?
    var id: String?
}
struct MainList {
    var type: String
}

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import SDWebImage

class TrainingCoursesVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var traingCourcesCollectionView: UICollectionView!
    
//variables
    var cources:[Courses] = [Courses]()
    var mainList:[MainList] = [MainList(type:"amateurTrainings"),MainList(type:"oldTrainings"),MainList(type: "proTrainings"),MainList(type: "youngTrainings")]
    var selectedIndex = -1
    var courseID = ""
    var courseType = ""

    override func viewDidLoad() {
        super.viewDidLoad()
          setup()
          titleLabel.text = "new_courses".localized()
    }
    func setup(){
        traingCourcesCollectionView.delegate = self
        traingCourcesCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
   

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension TrainingCoursesVC :UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == traingCourcesCollectionView {
            return cources.count
        }else{
            return mainList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCollectionView {
            if let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "CoursesListCell", for: indexPath)as? coursesTypeCell{
                  cell.listTypeLabel.text = mainList[indexPath.item].type
                  if indexPath.item == selectedIndex{
                      cell.coloredBackgroundView.backgroundColor = #colorLiteral(red: 0.7241227627, green: 0.8952017426, blue: 0.7469118237, alpha: 1)
                      cell.WhiteView.backgroundColor = #colorLiteral(red: 0.7241227627, green: 0.8952017426, blue: 0.7469118237, alpha: 1)
                      cell.listTypeLabel.textColor = #colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1)
                  }else{
                      cell.coloredBackgroundView.backgroundColor = UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1.0)
                      cell.WhiteView.backgroundColor = UIColor.white
                      cell.listTypeLabel.textColor = UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1.0)
                  }
              return cell
              }
        }else{
              if let cell = traingCourcesCollectionView.dequeueReusableCell(withReuseIdentifier: "CourcesCell", for: indexPath)as? TrainingCoursesCell{
                    cell.traingImageView.sd_setImage(with: URL(string: cources[indexPath.item].image!))
                    cell.nameLabel.text = cources[indexPath.item].title
                    cell.dateLabel.text = cources[indexPath.item].date
                    return cell
            }
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == traingCourcesCollectionView{
            self.courseID = cources[indexPath.item].id!
            print("MaincourseID = \(courseID)")
            performSegue(withIdentifier: "courseDetails", sender: self)
        }else{
            selectedIndex = indexPath.item
            print("\(selectedIndex)")
            collectionView.reloadData()
            if indexPath.item == 0{
                retreiveAmateurTrainings()
                self.courseType = "amateur"
            }else if indexPath.item == 1{
                retreiveOldTrainings()
                self.courseType = "old"
            }else if indexPath.item == 2{
                retreiveProTrainings()
                self.courseType = "pro"
            }else{
                retreiveYoungTrainings()
                self.courseType = "young"
            }
        }

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.20 , height: 100.0)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CourseDetailsVC
        vc.courseID = self.courseID
        vc.courseType = self.courseType
    }
   
}
extension TrainingCoursesVC{
    func retreiveAmateurTrainings(){
        let db = Firestore.firestore()
        db.collection("amateurTrainings").getDocuments() { (querySnapshot, err) in
               print("fireStore is connected")
               if let err = err {
                   print("Error getting documents: \(err)")
               } else {
                   for document in querySnapshot!.documents {
                       print("\(document.documentID) => \(document.data())")
                       let id = document.documentID
                       let imageURL = document["photoUrl"] as? String
                       let title = document["title"] as? String
                       let date = document["date"] as? String
                       let url = URL(string: imageURL!)
                       let latestnewsObj = Courses(image: imageURL!, title: title!, date: date!,id: id)
                       self.cources.append(latestnewsObj)
                       self.traingCourcesCollectionView.reloadData()
                   }
               }
           }
       }
       func retreiveOldTrainings(){
           let db = Firestore.firestore()
           db.collection("oldTrainings").getDocuments() { (querySnapshot, err) in
               if let err = err {
                   print("Error getting documents: \(err)")
               } else {
                   for document in querySnapshot!.documents {
                       let id = document.documentID
                       let imageURL = document["photoUrl"] as? String
                       let title = document["title"] as? String
                       let date = document["date"] as? String
                       let url = URL(string: imageURL!)
                       let latestnewsObj = Courses(image: imageURL!, title: title!, date: date!,id: id)
                       self.cources.append(latestnewsObj)
                       self.traingCourcesCollectionView.reloadData()
                   }
               }
           }
       }
       func retreiveProTrainings(){
              let db = Firestore.firestore()
              db.collection("proTrainings").getDocuments() { (querySnapshot, err) in
                  if let err = err {
                      print("Error getting documents: \(err)")
                  } else {
                      for document in querySnapshot!.documents {
                          let id = document.documentID
                          let imageURL = document["photoUrl"] as? String
                          let title = document["title"] as? String
                          let date = document["date"] as? String
                          let url = URL(string: imageURL!)
                          let latestnewsObj = Courses(image: imageURL!, title: title!, date: date!,id: id)
                          self.cources.append(latestnewsObj)
                          self.traingCourcesCollectionView.reloadData()
                      }
                  }
              }
          }
       func retreiveYoungTrainings(){
           let db = Firestore.firestore()
           db.collection("youngTrainings").getDocuments() { (querySnapshot, err) in
               if let err = err {
                   print("Error getting documents: \(err)")
               } else {
                   for document in querySnapshot!.documents {
                       let id = document.documentID
                       let imageURL = document["photoUrl"] as? String
                       let title = document["title"] as? String
                       let date = document["date"] as? String
                       let url = URL(string: imageURL!)
                       let latestnewsObj = Courses(image: imageURL!, title: title!, date: date!,id: id)
                       self.cources.append(latestnewsObj)
                       self.traingCourcesCollectionView.reloadData()
                   }
               }
           }
       }
    
}
