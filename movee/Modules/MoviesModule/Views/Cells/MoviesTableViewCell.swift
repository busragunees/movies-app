//
//  MoviesTableViewCell.swift
//  movee
//
//  Created by Gunes, Busra on 28.11.2022.
//

import UIKit

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

    private func setItem(item: PopulerMovies) {
        self.movieNameLabel.text = item.originalTitle
        self.movieScoreLabel.text = "\(item.voteAverage ?? 0)"
    }
}
