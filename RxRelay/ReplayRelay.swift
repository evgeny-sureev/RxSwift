//
//  ReplayRelay.swift
//  RxRelay
//
//  Created by Evgeny Sureev on 18/12/2019.
//  Copyright © 2019 Krunoslav Zaher. All rights reserved.
//

import RxSwift

/// ReplayRelay is a wrapper for `ReplaySubject`.
///
/// Unlike `ReplaySubject` it can't terminate with error or completed.
public final class ReplayRelay<Element>: ObservableType {
    private let _subject: ReplaySubject<Element>

    /// Accepts `event` and emits it to subscribers
    public func accept(_ event: Element) {
        self._subject.onNext(event)
    }

    /// Initializes replay relay with instance of `ReplaySubject` that replays at most `bufferSize` last elements of sequence.
    ///
    /// - parameter bufferSize: Maximal number of elements to replay to observer after subscription.
    public init(bufferSize: Int) {
        self._subject = ReplaySubject.create(bufferSize: bufferSize)
    }

    /// Subscribes observer
    public func subscribe<Observer: ObserverType>(_ observer: Observer) -> Disposable where Observer.Element == Element {
        return self._subject.subscribe(observer)
    }

    /// - returns: Canonical interface for push style sequence
    public func asObservable() -> Observable<Element> {
        return self._subject.asObservable()
    }
}
