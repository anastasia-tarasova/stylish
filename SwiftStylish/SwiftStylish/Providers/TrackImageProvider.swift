//
//  TrackImageProvider.swift
//  SwiftStylish
//
//  Created by Anastasia Tarasova on 09/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import UIKit

/**
 Provides **progressImage** value to subclasses of:
 - UIProgressView
 */
class TrackImageProvider: BaseProvider {}

extension TrackImageProvider: ProgressViewProviderProtocol
{
    func applyItem(forProgressView progressView: UIProgressView, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        progressView.trackImage = try value.toImage(existingImage: progressView.trackImage)
    }
}
