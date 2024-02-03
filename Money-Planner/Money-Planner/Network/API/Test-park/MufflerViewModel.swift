//
//  GitHubViewModel.swift
//  Money-Planner
//
//  Created by p_kxn_g on 2/1/24.
//

import Foundation
import RxSwift
import RxMoya
import Moya

// 각자 맡은 파트 알아서 수정해서 사용
// MyRepo에 활용할 모델 이름 넣으면 됩니다. 만약 connect Model 을 만들었다하면 ConnectModel을 MyRepo 자리에 넣는 겁니다.
// 헷갈린다면 func connect()를 참고하세요.

class MufflerViewModel {
    private let provider = MoyaProvider<MufflerAPI>().rx

    // Member Controller
//    func refreshToken() -> Observable<MyRepo> {
//        return provider.request(.refreshToken)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//    func loginKakao() -> Observable<MyRepo> {
//        return provider.request(.loginKakao)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func loginApple() -> Observable<MyRepo> {
//        return provider.request(.loginApple)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
    func connect() -> Observable<ConnectModel> {
        return provider.request(.connect)
            .map(ConnectModel.self)
            .asObservable()
    }
//
//    // Goal Controller
//    func createGoal() -> Observable<MyRepo> {
//        return provider.request(.createGoal)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getPreviousGoals() -> Observable<MyRepo> {
//        return provider.request(.getPreviousGoals)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func deleteGoal(goalId: String) -> Observable<MyRepo> {
//        return provider.request(.deleteGoal(goalId: goalId))
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    // Expense Controller
//    func createExpense() -> Observable<MyRepo> {
//        return provider.request(.createExpense)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getExpense(expenseId: String) -> Observable<MyRepo> {
//        return provider.request(.getExpense(expenseId: expenseId))
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getWeeklyExpense() -> Observable<MyRepo> {
//        return provider.request(.getWeeklyExpense)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func searchExpense() -> Observable<MyRepo> {
//        return provider.request(.searchExpense)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getMonthlyExpense() -> Observable<MyRepo> {
//        return provider.request(.getMonthlyExpense)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getDailyExpense() -> Observable<MyRepo> {
//        return provider.request(.getDailyExpense)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    // Category Controller
//    func createCategory() -> Observable<MyRepo> {
//        return provider.request(.createCategory)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    // Rate Controller
//    func updateRate(date: String) -> Observable<MyRepo> {
//        return provider.request(.updateRate(date: date))
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getRates() -> Observable<MyRepo> {
//        return provider.request(.getRates)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    // Home Controller
//    func getNow() -> Observable<MyRepo> {
//        return provider.request(.getNow)
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getGoal(goalId: String) -> Observable<MyRepo> {
//        return provider.request(.getGoal(goalId: goalId))
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getGoalByYearMonth(goalId: String, yearMonth: String) -> Observable<MyRepo> {
//        return provider.request(.getGoalByYearMonth(goalId: goalId, yearMonth: yearMonth))
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getGoalByCategory(goalId: String, categoryId: String) -> Observable<MyRepo> {
//        return provider.request(.getGoalByCategory(goalId: goalId, categoryId: categoryId))
//            .map(MyRepo.self)
//            .asObservable()
//    }
//
//    func getBasicHomeInfo() -> Observable<MyRepo> {
//        return provider.request(.getBasicHomeInfo)
//            .map(MyRepo.self)
//            .asObservable()
//    }
}