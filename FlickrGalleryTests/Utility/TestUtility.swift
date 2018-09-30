//
//  TestUtility.swift
//  FlickrGalleryTests
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import RxSwift
import RxTest
@testable import FlickrGallery

extension TestScheduler {
    /**
     Builds testable observer for specific observable sequence, binds it's results and sets up disposal.

     - parameter source: Observable sequence to observe.
     - returns: Observer that records all events for observable sequence.
     */
    func record<O: ObservableConvertibleType>(source: O) -> TestableObserver<O.E> {
        let observer = createObserver(O.E.self)
        let disposable = source.asObservable().bind(to: observer)
        scheduleAt(100000) {
            disposable.dispose()
        }
        return observer
    }
}

struct TestSchedulerProvider: SchedulerProtocol {
    var mainScheduler: SchedulerType
    let backgroundScheduler: SchedulerType

    init(schedule: SchedulerType) {
        mainScheduler = schedule
        backgroundScheduler = schedule
    }
}
