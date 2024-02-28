//
//  GoalAPI.swift
//  Money-Planner
//
//  Created by 유철민 on 1/26/24.
//

import Foundation
import RxMoya
import Moya
import RxSwift

enum GoalAPI : TargetType {
    //가능
    case postGoal(request: PostGoalRequest)
    
    //모름
    case deleteGoal(goalId: Int)
    case getGoalDetail(goalId: String)
    
    //가능
    case now
    case notNow(endDate: String?)
   
    //모름
    case getGoalReport(goalId: String)
    case getWeeklyExpenses(goalId: String, startDate: String, endDate: String, size: String, lastDate: String?, lastExpenseId: String?)
    
    case getPreviousGoals
    case postContent(request: PostGoalRequest)
}

extension GoalAPI : BaseAPI {
    
    var headers: [String: String]? {
        // Replace 'YourTokenHere' with the actual bearer token.
        return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzMjkwMTA2OTM0IiwiYXV0aCI6IlVTRVIiLCJleHAiOjE3MDkxODYwNDl9.UBQS77CjxxCMsMIsBo3fuUzqFaUhgxktSIza1sS8e8I"]
    }
    
    var path: String {
        switch self {
        case .postGoal(let request):
            return "/api/goal"
        case .deleteGoal(let goalId):
            return "/api/goal/\(goalId)"
        case .getGoalDetail(let goalId):
            return "/api/goal/\(goalId)"
        case .now:
            return "/api/goal/now"
        case .notNow:
            return "/api/goal/not-now"
        case .getGoalReport(let goalId):
            return "/api/goal/report/\(goalId)"
        case .getWeeklyExpenses:
            return "/api/expense/weekly"
        case .getPreviousGoals:
            return "/api/goal/previous"
        case .postContent :
            return "/api/goal"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .now:
            return .get
        case .postGoal:
            return .post
        case .getGoalDetail:
            return .get
        case .getWeeklyExpenses:
            return .get
        case .deleteGoal:
            return .delete
        case .postContent:
            return .post
        default :
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .postGoal(let request):
            return .requestJSONEncodable(request)
        case .getGoalReport: // getGoalReport 추가
            return .requestPlain
        case .now:
            return .requestPlain
        case .notNow(let endDate):
            var parameters: [String: Any] = [:]
            if let endDate = endDate {
                parameters["endDate"] = endDate
            }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .getWeeklyExpenses(let goalId, let startDate, let endDate, let size, let lastDate, let lastExpenseId):
            var parameters: [String: Any] = ["goalId": goalId, "startDate": startDate, "endDate": endDate, "size": size]
            if let lastDate = lastDate {
                parameters["lastDate"] = lastDate
            }
            if let lastExpenseId = lastExpenseId {
                parameters["lastExpenseId"] = lastExpenseId
            }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
        case .getGoalDetail:
            return .requestPlain
        case .deleteGoal:
            return .requestPlain
            
        case .postContent(let request):
            return .requestJSONEncodable(request)
            
        default:
            return .requestPlain
        }
    }
    
    var sampleData: Data { return Data() }
}


//let provider = MoyaProvider<GoalAPI>()
//let disposeBag = DisposeBag()

//func postGoal(request: PostGoalRequest) {
//    provider.rx.request(.postGoal(request: request))
//        .filterSuccessfulStatusCodes()
//        .subscribe { event in
//            switch event {
//            case .success(let response):
//                print("Goal successfully posted")
//                // 추가적인 성공 처리 로직
//            case .failure(let error):
//                print("Error posting goal: \(error.localizedDescription)")
//            }
//        }
//        .disposed(by: disposeBag)
//}
//
//
//func fetchNowGoal() {
//    provider.rx.request(.now)
//        .filterSuccessfulStatusCodes()
//        .map(NowResponse.self)
//        .subscribe(onSuccess: { response in
//            print("Now Goal Title: \(response.result.goalTitle)")
//        }, onFailure: { error in
//            print("Error: \(error)")
//        })
//        .disposed(by: disposeBag)
//}
//
//func fetchNotNowGoals() {
//    provider.rx.request(.notNow)
//        .filterSuccessfulStatusCodes()
//        .map(NotNowResponse.self)
//        .subscribe(onSuccess: { response in
//            print("Not Now Future Goals Count: \(response.result.futureGoal.count)")
//            print("Not Now Ended Goals Count: \(response.result.endedGoal.count)")
//            print("Has Next: \(response.result.hasNext)")
//        }, onFailure: { error in
//            print("Error: \(error)")
//        })
//        .disposed(by: disposeBag)
//}
//
//func fetchGoalDetail(goalId: Int) {
//    provider.rx.request(.getGoalDetail(goalId: goalId)) { result in
//        switch result {
//        case .success(let response):
//            do {
//                let goalDetailResponse = try JSONDecoder().decode(GoalDetailResponse.self, from: response.data)
//                // 여기서 goalDetailResponse.result를 사용하는 로직 구현
//            } catch {
//                print("Error decoding GoalDetail: \(error)")
//            }
//        case .failure(let error):
//            print("Error fetching goal detail: \(error.localizedDescription)")
//        }
//    }
//}
//
//func fetchGoalReport(for goalId: Int) {
//    provider.rx.request(.goalReport(goalId: goalId))
//        .filterSuccessfulStatusCodes()
//        .map(GoalReportResponse.self)
//        .subscribe { event in
//            switch event {
//            case .success(let response):
//                print("Zero Day Count: \(response.result.zeroDayCount)")
//                // 카테고리 별 총 비용 출력
//                response.result.categoryTotalCosts.forEach { cost in
//                    print("\(cost.categoryName): \(cost.totalCost)")
//                }
//                // 카테고리 목표 보고서 출력
//                response.result.categoryGoalReports.forEach { report in
//                    print("Category: \(report.categoryName), Budget: \(report.categoryBudget), Total Cost: \(report.totalCost)")
//                }
//            case .failure(let error):
//                print("Error fetching goal report: \(error.localizedDescription)")
//            }
//        }.disposed(by: disposeBag)
//}
