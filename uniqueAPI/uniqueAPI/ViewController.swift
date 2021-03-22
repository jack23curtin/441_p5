//
//  ViewController.swift
//  uniqueAPI
//
//  Created by Jack Curtin on 3/19/21.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        // Do any additional setup after loading the view.
    }

    @IBAction func addArt(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.6, height: 0.9, length: 0.05, chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node.position = SCNVector3(0,0,-1)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func shiftArt(_ sender: Any) {
        self.restartSession()
        
    }
    func restartSession(){
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])

        
    }
}

