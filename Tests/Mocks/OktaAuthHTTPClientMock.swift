/*
* Copyright (c) 2020, Okta, Inc. and/or its affiliates. All rights reserved.
* The Okta software accompanied by this notice is provided pursuant to the Apache License, Version 2.0 (the "License.")
*
* You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*
* See the License for the specific language governing permissions and limitations under the License.
*/

import Foundation
@testable import OktaAuthNative

class OktaAuthHTTPClientMock: OktaHTTPRequestListenerProtocol {

    let data: Data?
    let httpResponse: HTTPURLResponse?
    var error: Error?
    var didSendRequest = false
    
    init(data: Data?, httpResponse: HTTPURLResponse?, error: Error?) {
        self.data = data
        self.httpResponse = httpResponse
        self.error = error
    }

    func sendRequest(_ request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        didSendRequest = true
        completionHandler(data, httpResponse, error)
    }
}
