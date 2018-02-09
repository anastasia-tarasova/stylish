//
//  BackgroundImageProvider.swift
//  SwiftStylish
//

import UIKit

/**
 Provides **backgroundImage** value to subclasses of:
 - UIButton
 - UINavigationBar
 - UISegmentedControl
 - UITabBar
 */
class BackgroundImageProvider: BaseProvider{}

extension BackgroundImageProvider: ButtonProviderProtocol
{
    func applyItem(forButton button: UIButton, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        let state = item.state.toControlState()
        button.setImage(try value.toImage(existingImage: button.image(for: state)), for: state)
    }
}

extension BackgroundImageProvider: NavigationBarProviderProtocol
{
    func applyItem(forNavigationBar navigationBar: UINavigationBar, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        let (image, metrics) = try value.toBarImage()
        navigationBar.setBackgroundImage(image, for: metrics)
    }
}

extension BackgroundImageProvider: SegmentedControlProviderProtocol
{
    func applyItem(forSegmentedControl segmentedControl: UISegmentedControl, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        let (image, metrics) = try value.toBarImage()
        segmentedControl.setBackgroundImage(image, for: item.state.toControlState(), barMetrics: metrics)
    }
}

extension BackgroundImageProvider: TabBarProviderProtocol
{
    func applyItem(forTabBar tabBar: UITabBar, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        tabBar.backgroundImage = try value.toImage()
    }
}

extension BackgroundImageProvider: TextFieldProviderProtocol
{
    func applyItem(forTextField textField: UITextField, item: StyleItem, variables: StyleVariables?) throws {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        textField.background = try value.toImage(existingImage: textField.background)
    }
}
