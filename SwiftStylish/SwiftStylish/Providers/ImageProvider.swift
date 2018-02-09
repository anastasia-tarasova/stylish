//
//  ImageProvider.swift
//  SwiftStylish
//

import UIKit

/**
 Provides **image** value to subclasses of:
  - UIButton
  - UIImageView
  - UIBarButtonItem
 */
class ImageProvider: BaseProvider {}

extension ImageProvider: ButtonProviderProtocol
{
    func applyItem(forButton button: UIButton, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        let state = item.state.toControlState()
        button.setImage(try value.toImage(existingImage: button.image(for: state)), for: state)
    }
}

extension ImageProvider: ImageViewProviderProtocol
{
    func applyItem(forImageView imageView: UIImageView, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        
        if item.state == .highlighted
        {
            imageView.highlightedImage = try value.toImage()
        }
        else
        {
            imageView.image = try value.toImage()
        }
    }
}

extension ImageProvider: BarButtonItemProviderProtocol
{
    func applyItem(forBarButtonItem barButtonItem: UIBarButtonItem, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        barButtonItem.image = try value.toImage()
    }
}

extension ImageProvider: TabBarItemProviderProtocol
{
    func applyItem(forTabBarItem tabBarItem: UITabBarItem, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        tabBarItem.image = try value.toImage(existingImage: tabBarItem.image)
    }
}

// TODO: SegmentedControlProviderProtocol
// TODO: SwitchViewProviderProtocol
