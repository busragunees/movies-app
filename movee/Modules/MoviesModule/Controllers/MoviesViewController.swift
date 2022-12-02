//
//  ViewController.swift
//  movee
//
//  Created by Gunes, Busra on 24.11.2022.
//

import UIKit

class MoviesViewController: UIViewController {
    @IBOutlet private weak var populerMoviesTableView: UITableView!
    private let populerMoviesCellReuseIdentifier = "PopulerMoviesTableViewCell"
    private let viewModel = PopulerMoviesViewModel()
    private var populerMovies: [PopulerMovies]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPopulerMovies()
        setupUI()
    }
    private func setupUI() {
        viewModel.viewDelegate = self
        populerMoviesTableView.delegate = self
        populerMoviesTableView.dataSource = self
        registerTableView()
    }
    private func registerTableView() {
        self.populerMoviesTableView.register(.init(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: populerMoviesCellReuseIdentifier)
    }
}

extension MoviesViewController: PopulerMoviesViewModelProtocol {
    func fetchPopulerMovies(items: [PopulerMovies]?) {
        populerMovies = items
       // print("items", items)
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        populerMovies?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: populerMoviesCellReuseIdentifier) as? MoviesTableViewCell
        return cell ?? UITableViewCell()
    }
}
