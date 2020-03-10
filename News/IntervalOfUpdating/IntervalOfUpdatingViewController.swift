//
//  IntervalOfUpdatingViewController.swift
//  News
//
//  Created by Игорь on 31.01.2020.
//  Copyright (c) 2020 Igor Zhyzhyrii. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol IntervalOfUpdatingDisplayLogic: class {
    func displaySavedIntervalOfUpdating(viewModel: IntervalOfUpdating.GetSavedIntervalOfUpdating.ViewModel)
}

class IntervalOfUpdatingViewController: UIViewController, IntervalOfUpdatingDisplayLogic {
    
    // MARK: - @IBOutlets
    
    @IBOutlet var timeIntervalPickerView: UIPickerView!
    
    // MARK: - Public properties
    
    var interactor: IntervalOfUpdatingBusinessLogic?
    
    // MARK: - Private properties
    
    private var hours = 0
    private var minutes = 0
    private var seconds = 0
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IntervalOfUpdatingConfigurator.shared.configure(with: self)
        
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.getSavedIntervalOfUpdatingInSeconds()
    }
    
    // MARK: - Private methods
    
    private func configureView() {
        view.backgroundColor = Constants.Colors.backGroundColor
    }
    
    // MARK: - Display saved interval of updating
    
    func displaySavedIntervalOfUpdating(viewModel: IntervalOfUpdating.GetSavedIntervalOfUpdating.ViewModel) {
        hours   = viewModel.hours
        minutes = viewModel.minutes
        seconds = viewModel.seconds
        
        timeIntervalPickerView.selectRow(hours, inComponent: 0, animated: true)
        timeIntervalPickerView.selectRow(minutes, inComponent: 1, animated: true)
        timeIntervalPickerView.selectRow(seconds, inComponent: 2, animated: true)
    }
    
}

extension IntervalOfUpdatingViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1,2:
            return 60
        default:
            return 0
        }
    }
    
}

extension IntervalOfUpdatingViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        switch component {
        case 0:
            attributedString = NSAttributedString(string: "\(row) Hrs", attributes: [NSAttributedString.Key.foregroundColor : Constants.Colors.titleTextColor])
        case 1:
            attributedString = NSAttributedString(string: "\(row) Mins", attributes: [NSAttributedString.Key.foregroundColor : Constants.Colors.titleTextColor])
        case 2:
            attributedString = NSAttributedString(string: "\(row) Secs", attributes: [NSAttributedString.Key.foregroundColor : Constants.Colors.titleTextColor])
        default:
            attributedString = nil
        }
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hours = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break
        }
        
        let savedInterval = TimeHelper.convertTimeToSeconds(hours: hours, minutes: minutes, seconds: seconds)
        
        let request = IntervalOfUpdating.SaveIntervalOfUpdating.Request(seconds: savedInterval)
        interactor?.saveIntervalOfUpdating(request: request)
    }
    
}
