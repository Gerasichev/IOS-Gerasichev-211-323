//
//  HomeViewController.swift
//  FirstApp
//
//  Created by Герасичев Сергей on 21.12.2023.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var tableView: UITableView = .init(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Forecast🌤️"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .lightGray
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        setTableViewDelegates()
        
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.reuseIdentifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsForTableView()
    }
    
    func setTableViewDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setConstraintsForTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocalData.shared.forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let localForecast = LocalData.shared.forecast[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.reuseIdentifier) as! ForecastTableViewCell
        cell.set(title: localForecast.city, forecast: localForecast.fiveDaysForecast.first ?? "+0 ☁️")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedForecast = LocalData.shared.forecast[indexPath.row]
        navigationController?.pushViewController(ForecastDetailViewController(forecast: selectedForecast), animated: true)
    }
}
