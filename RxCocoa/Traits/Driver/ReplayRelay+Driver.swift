//
//  ReplayRelay+Driver.swift
//  RxCocoa
//
//  Created by Evgeny Sureev on 18/12/2019.
//  Copyright © 2019 Krunoslav Zaher. All rights reserved.
//

import RxSwift
import RxRelay

extension ReplayRelay {
    /// Converts `ReplayRelay` to `Driver`.
    ///
    /// - returns: Observable sequence.
    public func asDriver() -> Driver<Element> {
        let source = self.asObservable()
            .observeOn(DriverSharingStrategy.scheduler)
        return SharedSequence(source)
    }
}
