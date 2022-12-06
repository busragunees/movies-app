//
//  MoviesTableViewCell.swift
//  movee
//
//  Created by Gunes, Busra on 28.11.2022.
//

import UIKit
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var movieGenreLabel: UILabel!
    @IBOutlet private weak var movieDateLabel: UILabel!
    @IBOutlet private weak var movieScoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setItem(item: PopulerMovies) {
        self.movieNameLabel.text = item.originalTitle
        self.movieScoreLabel.text = String(format: "%.1f", item.voteAverage ?? 0)
        self.movieDateLabel.text = item.releaseDate
        guard let itemURL = item.posterPath else {return}
        let imageURL = String(format: "%@%@%@", Api.imageBaseURL, Api.imagePATH, itemURL)
        self.movieImage.setImage(imageURL)
        if let genreIDS = item.genreIDS {
           let genreTypes: [String] = genreIDS.map { genreId in
               GenreManager.sharedInstance.genreTypes.filter {
                   $0?.id == genreId
               }.first??.name ?? ""
            }
            self.movieGenreLabel.text = genreTypes.joined(separator: " ,")
        }
    }
}
