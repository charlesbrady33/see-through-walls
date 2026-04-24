import MWDATCore
import SwiftUI

struct MainAppView: View {
  let wearables: WearablesInterface
  @ObservedObject private var viewModel: WearablesViewModel

  init(wearables: WearablesInterface, viewModel: WearablesViewModel) {
    self.wearables = wearables
    self.viewModel = viewModel
  }

  var body: some View {
    if viewModel.registrationState == .registered {
      // User registered - show feature selection landing page
      FeatureSelectionView(wearables: wearables, wearablesVM: viewModel)
    } else {
      // User not registered - show localization home/onboarding flow
      LocalizationHomeView(wearablesVM: viewModel)
    }
  }
}
