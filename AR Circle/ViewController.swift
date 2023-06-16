//
//  ViewController.swift
//  SimpleBox
//
//  Created by Mohammad Azam on 11/17/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        let box = SCNBox(width: 0.05, height: 0.05, length: 0.05, chamferRadius: 3)
        
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
//            .firstMaterial?.diffuse.contents = UIColor(fromHexString: "32C25B").withAlphaComponent(0.8)
            
        
        box.materials = [material]
        
//      box.firstMaterial?.diffuse.contents = UIColor(fromHexString: "32C25B").withAlphaComponent(0.8)
        
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0, 0, -0.5)
        
        self.sceneView.scene.rootNode.addChildNode(boxNode)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
