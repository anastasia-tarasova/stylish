//
//  MainMenuViewController.swift
//  StylishExample
//
//  Created by Anastasia Tarasova on 08/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation
import UIKit

class MainMenuViewController: UIViewController
{
    private var menuItems = [MenuItem]()
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupMenuItems()
        self.setupTableView()
        self.title = "Main Menu"
    }
    
    // MARK: Setup
    
    private func setupTableView()
    {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        MainMenuItemCell.register(for: self.tableView)
    }
    
    private func setupMenuItems()
    {
        self.menuItems.append(MenuItem(title: "Buttons", navigationClosure: { [weak self] in
            do {
                let viewController = try Consts.Storyboards.main.instantiateViewController(ButtonsScreenViewController.self)
                self?.navigationController?.pushViewController(viewController, animated: true)
            
            } catch {
                print(error.localizedDescription)
            }
        }))
        
        self.menuItems.append(MenuItem(title: "Images", navigationClosure: { [weak self] in
            do {
                let viewController = try Consts.Storyboards.main.instantiateViewController(ImageScreenViewController.self)
                self?.navigationController?.pushViewController(viewController, animated: true)
                
            } catch {
                print(error.localizedDescription)
            }
        }))
        
        self.menuItems.append(MenuItem(title: "Labels", navigationClosure: { [weak self] in
            do {
                let viewController = try Consts.Storyboards.main.instantiateViewController(LabelScreenViewController.self)
                self?.navigationController?.pushViewController(viewController, animated: true)
                
            } catch {
                print(error.localizedDescription)
            }
        }))
    }
}

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MainMenuItemCell.reuseIdentifier, for: indexPath)
        
        if let menuCell = cell as? MainMenuItemCell
        {
            menuCell.setup(title: self.menuItems[indexPath.row].title)
        }
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        self.menuItems[indexPath.row].navigationClosure()
    }
}
