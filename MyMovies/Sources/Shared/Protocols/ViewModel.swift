//
//  ViewModel.swift
//  MyMovies
//
//  Created by Benjamin Dodgson on 1/2/25.
//

import SwiftUI

@Observable protocol ViewModel: Codable, Identifiable, Equatable, Mock {}
