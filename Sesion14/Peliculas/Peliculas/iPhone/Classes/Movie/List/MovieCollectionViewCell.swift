//
//  MovieTableViewCell.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 3/11/21.
//

import UIKit
import Alamofire

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    
    var objMovie: Movie!
    
    func updateData(_ objMovie: Movie) {
        
        self.objMovie = objMovie
        self.animateAppear()
        self.lblTitle.text = self.objMovie.name
        self.imgMovie.image = nil
        
        let urlService = self.objMovie.urlImage
        let request = AF.request(urlService, method: .get)
        
        request.response { response in
            
            if response.response?.url?.absoluteString == urlService {
                
                guard let data = response.data else {
                    self.imgMovie.image = nil
                    return
                }
                
                let image = UIImage(data: data)
                self.imgMovie.image = image
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.imgMovie.layer.cornerRadius = 10
    }
    
    private func animateAppear() {
        
        self.alpha = 0
        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        let randomDelay = CGFloat.random(in: 0...(0.7))
        
        UIView.animate(withDuration: 0.4, delay: randomDelay, options: [.curveEaseInOut], animations: {
            
            self.alpha = 1
            self.transform = .identity
            
        }, completion: nil)
    }
}

extension MovieCollectionViewCell {
    
    class func createInCollectionView(_ collectionView: UICollectionView, indexPath: IndexPath, objMovie: Movie) -> MovieCollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell
        cell?.updateData(objMovie)
        return cell ?? MovieCollectionViewCell()
    }
}
