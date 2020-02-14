//
//  SourceOfNewSettingsViewController.swift
//  News
//
//  Created by Игорь on 29.12.2019.
//  Copyright (c) 2019 Igor Zhyzhyrii. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SourceOfNewSettingsDisplayLogic: class {
    func displayNavigationTitle(viewModel: SourceOfNewSettings.DisplayNavigationTitle.ViewModel)
    
    func displaySourcesOfNews(viewModel: SourceOfNewSettings.DisplaySourceOfNew.ViewModel)
    func displayTabBarItemTitle(viewModel: SourceOfNewSettings.DisplayTabBarItemTitle.ViewModel) //TODO why 2 functions
    func displaySelectedSourceOfNew(viewModel: SourceOfNewSettings.SelectNewSource.ViewModel)
    
    func displayTabBarItem(viewModel: SourceOfNewSettings.SaveFeedSettings.ViewModel)
    
    func displayTitleOfTheNew(viewModel: SourceOfNewSettings.UpdateTitleOfTheNew.ViewModel)
    func displayAlertTheSameTitle(viewModel: SourceOfNewSettings.UpdateTitleOfTheNew.ViewModel)
}

class SourceOfNewSettingsViewController: UITableViewController, SourceOfNewSettingsDisplayLogic, ChangeValueOfSourceOfNewSwitcher {
    
    // MARK: - Outlets
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    // MARK: - Public properties
    
    var interactor: SourceOfNewSettingsBusinessLogic?
    var router: (NSObjectProtocol & SourceOfNewSettingsRoutingLogic & SourceOfNewSettingsDataPassing)?
    
    // MARK: - Private properties
    
    private var feedsModels: [FeedModel]!
    
    // MARK: - Object lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        SourceOfNewSettingsConfigurator.shared.configure(with: self)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SourceOfNewSettingsCell", bundle: nil), forCellReuseIdentifier: "SourceOfNewSettingsCell")
        
        displayNavigationTitle()
        displaySourceOfNew()
        displayTabBarTitle()
        
        configureView()
    }
    
    // MARK: - Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - Display navigation title
    
    func displayNavigationTitle() {
        let request = SourceOfNewSettings.DisplayNavigationTitle.Request()
        interactor?.displayNavigationTitle(request: request)
    }
    
    //TODO - bug needs to be fixed
    
    func displayNavigationTitle(viewModel: SourceOfNewSettings.DisplayNavigationTitle.ViewModel) {
        navigationItem.title = viewModel.title
    }
    
    // MARK: - Display source of new
    
    func displaySourceOfNew() {
        let request = SourceOfNewSettings.DisplaySourceOfNew.Request()
        interactor?.displaySourceOfNew(request: request)
    }
    
    func displaySourcesOfNews(viewModel: SourceOfNewSettings.DisplaySourceOfNew.ViewModel) {
        displaySourcesOfNews(feedsModels: viewModel.feedsModels)
    }
    
    // MARK: - Display tab bar title
    
    func displayTabBarTitle() {
        let request = SourceOfNewSettings.DisplayTabBarItemTitle.Request()
        interactor?.displayTabBarItemTitle(request: request)
    }
    
    func displayTabBarItemTitle(viewModel: SourceOfNewSettings.DisplayTabBarItemTitle.ViewModel) { // TODO why 2 functions
        displayTabBarItemTitle(numberOfTab: viewModel.numberOfTab, title: viewModel.title)
    }
    
    // MARK: - Select new`s source
    
    func selectNewSource(indexPath: IndexPath) {
        let request = SourceOfNewSettings.SelectNewSource.Request(feed: feedsModels[indexPath.row])
        interactor?.selectNewSource(request: request)
    }
    
    func displaySelectedSourceOfNew(viewModel: SourceOfNewSettings.SelectNewSource.ViewModel) {
        displaySourcesOfNews(feedsModels: viewModel.feedsModels)
    }
    
    // MARK: - Display bar item title
    
    func displayTabBarItem(viewModel: SourceOfNewSettings.SaveFeedSettings.ViewModel) {
        displayTabBarItemTitle(numberOfTab: viewModel.numberOfTab, title: viewModel.feedName)
    }
    
    func displayTitleOfTheNew(viewModel: SourceOfNewSettings.UpdateTitleOfTheNew.ViewModel) {
        
        if let indexPathOfEditedRow = viewModel.indexPathOfRow {
            let editedCell = tableView.cellForRow(at: indexPathOfEditedRow)
            editedCell?.textLabel?.text = viewModel.feeds[indexPathOfEditedRow.row].feedName
            
            feedsModels = viewModel.feeds
        }
    }
    
    // MARK: - Display alert that another new has the same title
    
    func displayAlertTheSameTitle(viewModel: SourceOfNewSettings.UpdateTitleOfTheNew.ViewModel) {
        UIHelpers.showMessage(withTitle: "The same title", message: "Title for tne new must be unique", viewController: self, buttonTitle: "OK")
    }
    
    // MARK: - Change source of new for the specific tab
    
    func changeSourceOfNewSwitcherValue(_ sender: UISwitch) {
        guard let cell = sender.superview?.superview as? SourceOfNewSettingsCell else { return }
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        selectNewSource(indexPath: indexPath)
    }
    
    // MARK: - Private methods
    
    private func displaySourcesOfNews(feedsModels: [FeedModel]) {
        self.feedsModels = feedsModels
        tableView.reloadData()
        for index in 0..<feedsModels.count {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! SourceOfNewSettingsCell
            let toggleValue = (feedsModels[index].isSelected) ? true : false
            cell.turnSourceOfNew.setOn(toggleValue, animated: true)
        }
        
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
    private func displayTabBarItemTitle(numberOfTab: Int, title: String) {
        let numberOfTab = numberOfTab
        tabBarController?.tabBar.items?[numberOfTab].title = title
    }
    
    private func configureView() {
        view.backgroundColor              = Constants.Colors.backGroundColor
        //        tabBar.barTintColor               = Constants.Colors.backGroundColor // TODO - need to make workable
        //        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        //        navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    //MARK: - @IBActions
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let request = SourceOfNewSettings.SaveFeedSettings.Request()
        interactor?.saveFeedSettings(request: request)
    }
    
}

extension SourceOfNewSettingsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SourceOfNewSettingsCell", for: indexPath) as! SourceOfNewSettingsCell
        
        cell.delegate = self
        
        cell.sourceLabel?.text = feedsModels[indexPath.row].feedName // TODO move to configure
        cell.configure()
        return cell
    }
}

extension SourceOfNewSettingsViewController {
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let changeTheTitleOfNew = UIContextualAction(style: .normal, title: "Update title") {_,_,complete in
            
            UIHelpers.showAlertWithTextField(withTitle: "Change title",
                                             message: "Provide new title for the new",
                                             viewController: self,
                                             buttonTitle: "OK",
                                             actionHandler: { (newTitle) in
                                                guard let newTitle = newTitle else { return }
                                                let request = SourceOfNewSettings.UpdateTitleOfTheNew.Request(feedName: newTitle, indexPathOfRow: indexPath)
                                                self.interactor?.updateTitleOfTheNew(request: request)
                                                
                                                complete(true)
            }) {
                complete(false)
            }
        }
        
        return UISwipeActionsConfiguration(actions: [changeTheTitleOfNew])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
}
