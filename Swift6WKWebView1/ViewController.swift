//
//  ViewController.swift
//  Swift6WKWebView1
//
//  Created by 鈴木正義 on 2021/04/05.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView = WKWebView()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        indicator.isHidden = true
        
        //大きさを決める
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        view.addSubview(webView)
        
        
        webView.navigationDelegate = self
        //URLをロード
        let url = URL(string: "https://www.kurashiru.com/") // <-　　String型からURL型にキャストしている
        let request = URLRequest(url: url!)
        webView.load(request)
        
        indicator.layer.zPosition = 2
        
    }
    
    
    //（webviewの）ロードが完了した時に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
        
    }
    //（webviewの）読み込みが開始された時に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = true
        indicator.stopAnimating()

    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    
}

