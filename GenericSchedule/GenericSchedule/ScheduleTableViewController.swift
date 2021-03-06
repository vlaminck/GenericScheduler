//
//  ScheduleTableViewController.swift
//  GenericSchedule
//
//  Created by Adam Ahrens on 1/23/17.
//  Copyright © 2017 Adam Ahrens. All rights reserved.
//

import UIKit

final class ScheduleTableViewController: UIViewController, ItemProviderDelegate {

  @IBOutlet weak var tableView: UITableView!

  private var dataSource: TableViewDataSource<Shift>!

  override func viewDidLoad() {
    super.viewDidLoad()

    // First Configuration
    let configurator = ShiftTableViewConfigurator(tableView: tableView)

    // Second Configuration
    //let configurator = ShiftTwoTableViewConfigurator(tableView: tableView)

    // Third Configuration
    //let configurator = ShiftThreeTableViewConfigurator(tableView: tableView)

    // Same for all Configurations
    let dataProvider = FetchedResultsDataProvider<Shift>(fetchRequest: Shift.defaultFetchRequest, managedObjectContext: CoreDataStack.stack.mainManagedObjectContext, delegate: self)
    dataSource = TableViewDataSource<Shift>(tableView: tableView, dataProvider: dataProvider, configurator: configurator)
  }

  //MARK: ItemProviderDelegate
  func itemProviderDidUpdate(updates: [ItemProviderUpdate]?) {
    dataSource.processUpdates(updates: updates)
  }
}
