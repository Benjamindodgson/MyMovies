//
//  ViewModelable.swift
//  MyMovies
//
//  Created by Benjamin Dodgson on 1/2/25.
//

import SwiftUI

/// A protocol that represents a basic ViewModel in the application.
///
/// `ViewModelable` is a lightweight protocol designed to establish a common
/// foundation for all ViewModels. It enforces conformance to the `Identifiable`
/// protocol, ensuring that each ViewModel has a unique identifier.
///
/// ### Requirements
/// - Conformance to the `Identifiable` protocol:
///   - A `ViewModelable` type must have an `id` property that uniquely identifies it.
///
/// ### Example Usage
/// ```swift
/// struct MovieViewModel: ViewModelable {
///     let id: UUID
///     let title: String
///     let description: String
/// }
///
/// let viewModel = MovieViewModel(id: UUID(), title: "Inception", description: "A mind-bending thriller.")
/// print(viewModel.id) // Prints the unique identifier for this ViewModel.
/// ```
///
/// ### Purpose
/// The `ViewModelable` protocol is ideal for use in MVVM (Model-View-ViewModel) architecture
/// as it provides a consistent interface for ViewModels, particularly when working
/// with SwiftUI's data-driven views like `List` or `ForEach`, which rely on identifiable items.
///
/// ### Use Cases
/// - Define common ViewModel types for use in SwiftUI views.
/// - Simplify data binding and state management by ensuring all ViewModels are uniquely identifiable.
///
/// By adopting `ViewModelable`, developers can ensure consistent and reusable ViewModel structures
/// across the application.
protocol ViewModelable: Identifiable {}
