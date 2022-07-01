//
//  Inspectable+Model.swift
//  rick-and-morty-appTests
//
//  Created by luis.betancourt on 01/07/2022.
//

import ViewInspector
@testable import rick_and_morty_app

extension HomeView: Inspectable {}
extension CharactersView: Inspectable {}
extension LocationsView: Inspectable {}
extension Inspection: InspectionEmissary {}
