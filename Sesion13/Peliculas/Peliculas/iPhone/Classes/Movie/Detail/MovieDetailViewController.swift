//
//  MovieDetailViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 27/10/21.
//

import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var imgBackgroundMovie: UIImageView!
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblReleaseDate: UILabel!
    @IBOutlet private weak var lblOverview: UILabel!
    @IBOutlet var arrayStars: [UIImageView]!
    
    var objMovie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupStyle()
        self.updateData()
    }
    
    private func setupStyle() {
        self.imgMovie.layer.cornerRadius = 10
    }
    
    private func updateData() {
    
        self.lblTitle.text = self.objMovie.name
        self.lblReleaseDate.text = self.objMovie.releaseDateFormat
        self.lblOverview.text = self.objMovie.overview
        
        for (index, imgStar) in self.arrayStars.enumerated() {
            imgStar.image = index > self.objMovie.voteAverage ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
        }
        
        let urlService = self.objMovie.urlImage
        let request = AF.request(urlService, method: .get)
        
        request.response { response in
            guard let data = response.data else { return }
            let image = UIImage(data: data)
            self.imgMovie.image = image
            self.imgBackgroundMovie.image = image
        }
    }
    
    @IBAction private func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
