//
//  ScheduleProvider.swift
//  FlickrGallery
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import RxSwift

protocol SchedulerProtocol {
    var mainScheduler: SchedulerType {get}
    var backgroundScheduler: SchedulerType {get}
}

struct SchedulerProvider: SchedulerProtocol {
    let mainScheduler: SchedulerType = MainScheduler.instance
    let backgroundScheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)
}
