//
//  ListMoviesAdapter.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 10/11/21.
//

import UIKit

protocol GenericListMoviesViewController: NSObjectProtocol {
    func goToDetailMovie(_ objMovie: Movie)
    func didDeleteMovieAtIndex(_ index: Int)
}

class ListMoviesAdapter: NSObject {
    
    var arrayMovies = [Movie]()
    private unowned var controller: GenericListMoviesViewController
    
    init(_ controller: GenericListMoviesViewController) {
        self.controller = controller
    }
    
    func setCollectionView(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ListMoviesAdapter: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let objMovie = self.arrayMovies[indexPath.row]
        return MovieCollectionViewCell.createInCollectionView(collectionView, indexPath: indexPath, objMovie: objMovie)
    }
}

extension ListMoviesAdapter: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let objMovie = self.arrayMovies[indexPath.row]
        self.controller.goToDetailMovie(objMovie)
    }
}

extension ListMoviesAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let collectionLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        let numberOfColums: CGFloat = 3
        let collectionWidth = collectionView.frame.width
        let padding = collectionLayout?.sectionInset ?? .zero
        let spacingCell = collectionLayout?.minimumInteritemSpacing ?? 0
    
        let spacings = (numberOfColums - 1) * spacingCell
        let availableWidth = collectionWidth - padding.left - padding.right - spacings
    
        let newWidth: CGFloat = (availableWidth / numberOfColums).rounded(.down)
        let newHeight = newWidth * 23 / 13
        return CGSize(width: newWidth, height: newHeight)
    }
}
