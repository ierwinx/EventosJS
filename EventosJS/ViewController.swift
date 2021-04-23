import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate {

    private var navegador: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "callbackHandler")

        let config = WKWebViewConfiguration()
        config.userContentController = contentController

        navegador = WKWebView(frame: .zero, configuration: config)
        navegador.load(URLRequest(url: URL(string: "http://10.51.66.215")!))
        navegador.navigationDelegate = self
        view = navegador

    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "callbackHandler" {
            guard let mensaje =  message.body as? String else {
                return
            }
            print("Se presiono el boton en la Web -> " + mensaje)
        }
    }

}

