//
//  CWMessageDispatchManager.swift
//  CWWeChat
//
//  Created by chenwei on 2017/3/26.
//  Copyright © 2017年 cwcoder. All rights reserved.
//

import UIKit


/// 消息发送管理队列
class CWMessageDispatchManager: NSObject {
    
    /// 队列
    var messageQueue:OperationQueue
    
    override init() {
        messageQueue = OperationQueue()
        messageQueue.name = "发送消息"
        messageQueue.maxConcurrentOperationCount = 5
        messageQueue.isSuspended = false
        super.init()
        monitorNetworkStatus()
    }
    
    /// 监听网络状态和XMPP连接状态
    func monitorNetworkStatus() {
        
    }
    
    
    func sendMessage(_ message: CWChatMessage, _ replace: Bool = false) {

        // 是否替换消息
        
        // 生成Operation
        let operation = CWMessageDispatchOperation.operationWithMessage(message)
        operation.local_ready = true
        messageQueue.addOperation(operation)
        
        // 添加回调
        
    }
    
    /**
     取消所有线程
     */
    func cancelAllOperation() {
        messageQueue.cancelAllOperations()
    }
    
    deinit {
        log.debug("CWMessageDispatchManager销毁..")
    }
    
    
}
