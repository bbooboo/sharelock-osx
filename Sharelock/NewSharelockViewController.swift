// NewSharelockViewController.swift
//
// Copyright (c) 2015 Auth0 (http://auth0.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Cocoa

class NewSharelockViewController: NSViewController {

    @IBOutlet weak var linkField: NSTextField!
    @IBOutlet weak var shareField: NSTextField!
    @IBOutlet weak var dataField: NSTextField!
    @IBOutlet weak var fieldContainerView: NSView!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fieldContainerView.wantsLayer = true
        self.fieldContainerView.layer?.backgroundColor = NSColor.whiteColor().CGColor
        self.progressIndicator.startAnimation(self)
    }

    override func viewDidAppear() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "finishedEditing:", name: NSControlTextDidEndEditingNotification, object: nil)
    }

    override func viewDidDisappear() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func finishedEditing(notification: NSNotification) {
        let data = self.dataField.stringValue
        let sharelist = self.shareField.stringValue

        if (countElements(data) > 0 && countElements(sharelist) > 0) {
            println("Generating link...")
        }
    }
}
