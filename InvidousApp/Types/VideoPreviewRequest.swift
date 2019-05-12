//
//  VideoPreviewRequest.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import API
import PromiseKit

/**
 Closure type used to fetch a list of VideoPreview objects using
 an optional continuation string.
 */
typealias VideoPreviewRequest = (String?) -> Promise<([VideoPreview], String?)>
