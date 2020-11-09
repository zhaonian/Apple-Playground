class BaseControllerViewModel : RealtimeUpdateListener {

  init(cache: Cache) {
    cache.delegate = self
  }

  func onRealtimeStateReceived(state: RealtimeState) {
//    if (state.id == 1) {
//      // Update Lock Controller UI.
//      print("Lock real-time state: " + state.content)
//    }
  }
}
