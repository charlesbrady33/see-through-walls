import MWDATCore
import SwiftUI

struct StreamSessionView: View {
  let wearables: WearablesInterface
  @ObservedObject private var wearablesViewModel: WearablesViewModel
  @StateObject private var viewModel: StreamSessionViewModel

  /// Optional dismiss callback for when launched from FeatureSelectionView
  var onDismiss: (() -> Void)?

  init(wearables: WearablesInterface, wearablesVM: WearablesViewModel, onDismiss: (() -> Void)? = nil) {
    self.wearables = wearables
    self.wearablesViewModel = wearablesVM
    self.onDismiss = onDismiss
    self._viewModel = StateObject(wrappedValue: StreamSessionViewModel(wearables: wearables))
  }

  var body: some View {
    ZStack {
      if viewModel.isStreaming {
        // Full-screen video view with streaming controls
        StreamView(viewModel: viewModel, wearablesVM: wearablesViewModel, onDismiss: onDismiss)
      } else {
        // Pre-streaming setup view with permissions and start button
        NonStreamView(viewModel: viewModel, wearablesVM: wearablesViewModel, onDismiss: onDismiss)
      }
    }
    .alert("Error", isPresented: $viewModel.showError) {
      Button("OK") {
        viewModel.dismissError()
      }
    } message: {
      Text(viewModel.errorMessage)
    }
  }
}
