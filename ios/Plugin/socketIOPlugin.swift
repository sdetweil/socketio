import Foundation
import Capacitor
import SocketIO
/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(socketIOPlugin)
public class socketIOPlugin: CAPPlugin {
    private let implementation = socketIO()
    private var server = "http://localhost";
    private var socket: SocketIOClient? = nil;
    private var manager: SocketManager? = nil;

    @objc func connect(_ call: CAPPluginCall) {
      server=call.getString("server") ?? "sample";
      manager = SocketManager(socketURL: URL(string:server)!);
        socket=manager?.socket(forNamespace: "/");
        socket?.connect();
        call.resolve(["socket":socket!]);
    }
    @objc func emit(_ call: CAPPluginCall) {
        let key = call.getString("key") ?? "key";
        let data:Any = call.getObject("data") ?? "data";
        socket!.emit(key, data as! [Any]);
        call.resolve();
    }
}
