//
//  PopoverViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 15.12.2020.
//

import UIKit

protocol SortPickerDelegate {
    func selectSortingMethod(method: KindOfSorting)
}

class PopoverViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let picker = UIPickerView()
    var delegate : SortPickerDelegate?
    var appState: AppState
    var arrayOfSorting : [KindOfSorting] = []
    
    init(appState: AppState) {
        self.appState = appState
        super.init(nibName: "PopoverVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfSorting = appState.sorting.arrayOfSorting
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        
        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        picker.delegate  = self
        picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfSorting.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayOfSorting[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.selectSortingMethod(method: arrayOfSorting[row])
    }
    
    
}
