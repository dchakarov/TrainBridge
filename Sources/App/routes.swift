import Vapor
import TrainInformationService

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

	let stationController = StationController()
//	router.get("station/list", use: stationController.list)
	router.get("station/board", String.parameter, use: stationController.board)

}
