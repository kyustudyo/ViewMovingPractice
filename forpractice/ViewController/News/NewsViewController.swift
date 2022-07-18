//
//  NewsViewController.swift
//  forpractice
//
//  Created by Hankyu Lee on 2022/07/18.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    private var viewModel = NewsViewModel()
    private var news: [Article]?
    private let tableView = UITableView()
    private let tableViewID = "newsCell"
    
    private let viewDescription : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "property observer를 통한 binding 구현 입니다."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupBinder()
        // Do any additional setup after loading the view.
    }
    private func setupBinder() {
        viewModel.getNews()
        viewModel.news.bind { [weak self] articleList in
            guard let this = self else {
                return
            }
            this.news = articleList?.articles
            this.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        
        view.backgroundColor = .green
        view.addSubview(tableView)
        view.addSubview(viewDescription)
        
        tableView.dataSource = self
        tableView.delegate =  self
        tableView.register(NewsCell.self, forCellReuseIdentifier: tableViewID)
        
        viewDescription.centerX(inView: view)
        viewDescription.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 10)
        tableView.anchor(top: viewDescription.bottomAnchor,left: view.safeAreaLayoutGuide.leftAnchor,bottom: view.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = news else {
            return 0
        }
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewID, for: indexPath) as? NewsCell,
              let news = news else {
            return UITableViewCell()
        }
        cell.news = news[indexPath.row]
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
