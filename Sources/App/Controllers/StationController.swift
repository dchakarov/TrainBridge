import Vapor
import TrainInformationService

extension DepartingService: Content {}

final class StationController {
	func board(_ req: Request) throws -> Future<[DepartingService]> {
		let station = try req.parameters.next(String.self)
		let dataPromise = req.eventLoop.newPromise([DepartingService].self)
		//		let station = "PAD"
		let trains = 5
		let trainInformationService = TrainInformationService(apiUrl: "https://lite.realtime.nationalrail.co.uk/OpenLDBWS/ldb11.asmx", token: "token")
		trainInformationService.departureBoard(for: station, items: trains) { result in
			switch result {
			case .success(let board):
				print(board)
				dataPromise.succeed(result: board)
				//				for service in board {
				//					trainInformationService.serviceDetails(service.serviceId) { callingPoints in
				//						print(callingPoints)
				//					}
			//				}
			case .error(let error):
				dataPromise.fail(error: error)
			}
		}
		return dataPromise.futureResult
	}
}
