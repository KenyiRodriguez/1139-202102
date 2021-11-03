//
//  MovieTableViewCell.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 3/11/21.
//

import UIKit
import Alamofire

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblReleaseDate: UILabel!
    @IBOutlet var arrayStars: [UIImageView]!
    
    var objMovie: Movie!
    
    func updateData(_ objMovie: Movie) {
        
        self.objMovie = objMovie
        
        self.animateAppear()
        
        self.lblTitle.text = self.objMovie.name
        self.lblReleaseDate.text = self.objMovie.releaseDateFormat
        
        for (index, imgStar) in self.arrayStars.enumerated() {
            imgStar.image = index > self.objMovie.voteAverage ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
        }
        
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
        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9).translatedBy(x: -100, y: 0)
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: {
            
            self.alpha = 1
            self.transform = .identity
            
        }, completion: nil)
    }
}

extension MovieTableViewCell {
    
    class func createInTableView(_ tableView: UITableView, indexPath: IndexPath, objMovie: Movie) -> MovieTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        cell?.updateData(objMovie)
        return cell ?? MovieTableViewCell()
    }
}
