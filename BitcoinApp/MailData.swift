//
//  MailData.swift
//  BitcoinApp
//
//  Created by Michał Dunajski on 06/09/2021.
//

import Foundation

struct ComposeMailData {
  let subject: String
  let recipients: [String]?
  let message: String
  let attachments: [AttachmentData]?
}

struct AttachmentData {
  let data: Data
  let mimeType: String
  let fileName: String
}
