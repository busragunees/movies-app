//
//  ViewController.swift
//  movee
//
//  Created by Gunes, Busra on 24.11.2022.
//

import UIKit

class MoviesViewController: UIViewController {
    @IBOutlet private weak var populerMoviesTableView: UITableView!
    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!
    private let populerMoviesCellReuseIdentifier = "moviesTableViewCell"
    var viewModel: PopulerMoviesViewModel = { () in
            .init()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = .blue
        self.navigationController?.navigationBar.largeContentTitle = "Popular movies"
        GenreManager.sharedInstance.fetchGenreTypes()
        viewModel.fetchPopulerMovies()
        setupUI()
        subscribeViewModelEvents()
    }
    private func setupUI() {
        populerMoviesTableView.delegate = self
        populerMoviesTableView.dataSource = self
        registerTableView()
    }
    private func registerTableView() {
        self.populerMoviesTableView.register(.init(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: populerMoviesCellReuseIdentifier)
    }
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchData = { [weak self] in
            guard let self = self else { return }
            self.populerMoviesTableView.reloadData()
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.populerMovies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: populerMoviesCellReuseIdentifier) as? MoviesTableViewCell
        guard let item = ( self.viewModel.populerMovies[indexPath.row]) else { return UITableViewCell()}
        cell?.setItem(item: item)
        return cell ?? UITableViewCell()
    }
}
