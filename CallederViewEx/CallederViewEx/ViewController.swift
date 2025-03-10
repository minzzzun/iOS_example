//
//  ViewController.swift
//  CallederViewEx
//
//  Created by 김민준 on 12/21/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
            super.viewDidLoad()
            view.backgroundColor = .gray // 배경색 설정
            
            // UICalendarView 생성
            let calendarView = UICalendarView()
            calendarView.translatesAutoresizingMaskIntoConstraints = false
            calendarView.visibleDateComponents = DateComponents(calendar: Calendar.current, year: 2024, month: 12, day: 1)

            // 뷰에 추가
            view.addSubview(calendarView)
            
            // 오토레이아웃 설정
            NSLayoutConstraint.activate([
                calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                calendarView.heightAnchor.constraint(equalToConstant: 400)
            ])
        }

}

extension ViewController : UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, canSelectDate dateComponents: DateComponents) -> Bool {
        // 원하는 기간만 true로 반환
        let calendar = Calendar.current
        let startDate = calendar.date(from: DateComponents(year: 2024, month: 12, day: 10))!
        let endDate = calendar.date(from: DateComponents(year: 2024, month: 12, day: 25))!
        guard let date = calendar.date(from: dateComponents) else { return false }
        return date >= startDate && date <= endDate
    }
}
