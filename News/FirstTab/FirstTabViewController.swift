//
//  FirstTabViewController.swift
//  News
//
//  Created by Игорь on 19.12.2019.
//  Copyright (c) 2019 Igor Zhyzhyrii. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FirstTabDisplayLogic: class {
    func displayNews(viewModel: FirstTab.GetNewsFromDBOrNetwork.ViewModel)
    func notDisplayNews()
    func displayNewsByRefreshing(viewModel: FirstTab.RefreshNews.ViewModel)
    func displayNewsByTimer(viewModel: FirstTab.GetNewsByTimer.ViewModel)
    func displayNavigationBar(viewModel: FirstTab.DisplayNavigatioBar.ViewModel)
}

class FirstTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FirstTabDisplayLogic {
    
    //MARK: - @IBOutlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    
    // MARK: - Public properties
    
    var interactor: FirstTabBusinessLogic?
    var router: (NSObjectProtocol & FirstTabRoutingLogic & FirstTabDataPassing)?
    
    var parser: GenericNewsParser!
    
    // MARK: - Private properties
    
    private var news: [DisplayedNew]?
    
    private var selectedIndex = -1
    private var tabBar: UITabBar!
    private var indexOfTab: Int!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirstTabConfigurator.shared.configure(with: self)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "NewCell", bundle: nil), forCellReuseIdentifier: "NewCell")
       
        tabBar = tabBarController?.tabBar
        guard let selectedBarItem = tabBar.selectedItem else { return }
        indexOfTab = tabBar.items?.firstIndex(of: (selectedBarItem))
        
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getNews(indexOfTab: indexOfTab)
        getNewsByTimer(indexOfTab: indexOfTab)
        
        displayNavigatioBar()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - Display navigation bar
    
    func displayNavigatioBar() {
        let request = FirstTab.DisplayNavigatioBar.Request(indexOfTab: indexOfTab)
        interactor?.getNavigationBar(request: request)
    }
    
    func displayNavigationBar(viewModel: FirstTab.DisplayNavigatioBar.ViewModel) {
        if let title = viewModel.title {
            navigationBar.isHidden = false
            navigationBar.topItem?.title = title
        } else {
            navigationBar.isHidden = true
        }
    }
    
    // MARK: Display news
    
    func displayNews(viewModel: FirstTab.GetNewsFromDBOrNetwork.ViewModel) {
        displayNews(news: viewModel.news)
    }
    
    //MARK: - Get news
    
    func getNews(indexOfTab: Int)  {
        let request = FirstTab.GetNewsFromDBOrNetwork.Request(indexOfTab: indexOfTab)
        interactor?.getNewsFromDBOrNetworkFor(request: request)
    }
    
    // MARK: - Get news by timer delegate method (to get new immediately - you do not need to select tab)
    
    func getNews() {
        getNewsByTimer(indexOfTab: indexOfTab)
    }
    
    // MARK: - Display news by refreshing
    
    func displayNewsByRefreshing(viewModel: FirstTab.RefreshNews.ViewModel) {
        displayNews(news: viewModel.news)
    }
    
    //MARK: - Display news by timer
    
    func displayNewsByTimer(viewModel: FirstTab.GetNewsByTimer.ViewModel) {
        displayNews(news: viewModel.news)
    }
    
    // MARK: - Get news via timer
    
    func getNewsByTimer(indexOfTab: Int) {
        let request = FirstTab.GetNewsByTimer.Request(indexOfTab: indexOfTab)
        interactor?.getNewsByTimer(request: request)
    }
    
    // MARK: - News are not displayed if the source is not selected for the specific tab
    
    func notDisplayNews() {
        self.news = nil
        tableView.reloadData()
    }
    
    // MARK: - Private methods
    
    private func displayNews(news: [DisplayedNew]?) {
        self.news = news
        tableView.reloadData()
    }
    
    private func getNewsByRefreshing(indexOfTab: Int) {
        let request = FirstTab.RefreshNews.Request(indexOfTab: indexOfTab)
        interactor?.getNewsByRefreshing(request: request)
    }
    
    private func configureView() {
        view.backgroundColor                                 = Constants.Colors.backGroundColor
        tableView.backgroundColor                            = Constants.Colors.backGroundColor
        
        tabBar.barTintColor                                  = Constants.Colors.backGroundColor

        navigationBar.titleTextAttributes                    = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationBar.topItem?.rightBarButtonItem?.tintColor = Constants.Colors.navigationTabBarItemColor
        navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    // MARK: - IBActions
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        getNewsByRefreshing(indexOfTab: indexOfTab)
    }
    
}

extension FirstTabViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = news else { return 0 }
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath) as! NewCell
        
        guard let news = news else { return UITableViewCell() }
        
        cell.configure(with: news[indexPath.row])
        
        if selectedIndex == indexPath.row {
            cell.newTextLabel.isHidden = false
        }
        
        return cell
    }
    
}

extension FirstTabViewController {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) { // TODO move to configure method in cell
        let cell = cell as! NewCell
        cell.backgroundColor         = Constants.Colors.backGroundColor
        cell.newTitleLabel.textColor = Constants.Colors.titleTextColor
        cell.newTextLabel.textColor  = Constants.Colors.mainTextColor
        cell.newTitleLabel.font      = Constants.Fonts.titleTextFontSize
        cell.newTextLabel.font       = Constants.Fonts.mainTextFontSize
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 120
        }
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! NewCell
        if indexPath.row == selectedIndex {
            selectedIndex = -1
            cell.newTextLabel?.isHidden = true
        }else{
            selectedIndex = indexPath.row
            cell.newTextLabel?.isHidden = false
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? NewCell else { return }
        cell.newTextLabel?.isHidden = true
        
    }
    
}
