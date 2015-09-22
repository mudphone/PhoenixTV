//
//  ViewController.swift
//  PhoenixTV
//
//  Created by Kyle Oba on 9/19/15.
//  Copyright © 2015 Kyle Oba. All rights reserved.
//

import UIKit
import SwiftPhoenixClient

class ViewController: UIViewController {
  @IBOutlet weak var userField: UITextField!
  @IBOutlet weak var messageField: UITextField!
  @IBOutlet weak var chatWindow: UITextView!
  @IBOutlet weak var sendButton: UIButton!
  let socket = Phoenix.Socket(domainAndPort: "localhost:4000", path: "socket", transport: "websocket")
  var topic: String? = "rooms:lobby"
  
  private func deliverMessage(msg: String) {
    let message = Phoenix.Message(message: ["user":userField.text!, "body": msg])
    print(message.toJsonString())
    
    let payload = Phoenix.Payload(topic: topic!, event: "new:msg", message: message)
    socket.send(payload)
    messageField.text = ""
    resetChatFontHack()
  }
  
  @IBAction func sendMessage(sender: UIButton) {
    deliverMessage(messageField.text!)
  }

  
  @IBAction func quickMessageButtonPressed(sender: UIButton) {
    deliverMessage("I need more Phoenix.")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    chatWindow.font = UIFont.systemFontOfSize(60.0)
    
    // Join the socket and establish handlers for users entering and submitting messages
    socket.join(topic: topic!, message: Phoenix.Message(subject: "status", body: "joining")) { channel in
      let chan = channel as! Phoenix.Channel
      
      chan.on("join") { message in
        print("you joined")
        self.chatWindow.text = "You joined the room.\n"

        self.resetChatFontHack()
      }
      
      chan.on("new:msg") { message in
        print("new message")
        guard let message = message as? Phoenix.Message,
          let username = message.message?["user"],
          let body     = message.message?["body"] else {
            return
        }
        let newMessage = "[\(username!)] \(body!)\n"
        let updatedText = self.chatWindow.text.stringByAppendingString(newMessage)
        self.chatWindow.text = updatedText
        
        self.resetChatFontHack()
      }
      
      chan.on("user:entered") { message in
        print("entered")
        let username = "anonymous"
        let updatedText = self.chatWindow.text.stringByAppendingString("[\(username) entered]\n")
        self.chatWindow.text = updatedText
        
        self.resetChatFontHack()
      }
    }
  }
  
  private func resetChatFontHack() {
    // This is a hack, not sure why text area font keeps resetting.
    chatWindow.font = UIFont.systemFontOfSize(60.0)
  }
  
}

