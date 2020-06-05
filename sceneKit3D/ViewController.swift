//
//  ViewController.swift
//  sceneKit3D
//
//  Created by Camilo Cabana on 5/06/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var animations = [String: CAAnimation]()
    var punch = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let scene = SCNScene()
        // Set the scene to the view
        sceneView.scene = scene
        
        loadAnimations()
        
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

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func loadAnimations () {
        // Load the character in the idle animation
        let idleScene = SCNScene(named: "art.scnassets/avatar/Macarena.dae")!
        
        // This node will be parent of all the animation models
        let node = SCNNode()
        
        // Add all the child nodes to the parent node
        for child in idleScene.rootNode.childNodes {
            node.addChildNode(child)
        }
        
        // Set up some properties
//        node.position = SCNVector3(0, -1, -2)
        node.position = SCNVector3(0, -2, -2.5)
        node.scale = SCNVector3(0.2, 0.2, 0.2)
        
        // Add the node to the scene
        sceneView.scene.rootNode.addChildNode(node)
        
        // Load all the DAE animations
//        loadAnimation(withKey: "dancing", sceneName: "art.scnassets/avatar/Punching.dae", animationIdentifier: "Punching.dae")
    }
    
//    func loadAnimation(withKey: String, sceneName:String, animationIdentifier:String) {
//        guard let sceneURL = Bundle.main.url(forResource: sceneName, withExtension: "dae") else { return }
//        let sceneSource = SCNSceneSource(url: sceneURL, options: nil)
//
//        if let animationObject = sceneSource?.entryWithIdentifier(animationIdentifier, withClass: CAAnimation.self) {
//            // The animation will only play once
//            animationObject.repeatCount = 1
//            // To create smooth transitions between animations
//            animationObject.fadeInDuration = CGFloat(1)
//            animationObject.fadeOutDuration = CGFloat(0.5)
//
//            // Store the animation for later use
//            animations[withKey] = animationObject
//        }
//    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let location = touches.first!.location(in: sceneView)
//
//        // Let's test if a 3D Object was touch
//        var hitTestOptions = [SCNHitTestOption: Any]()
//        hitTestOptions[SCNHitTestOption.boundingBoxOnly] = true
//
//        let hitResults: [SCNHitTestResult]  = sceneView.hitTest(location, options: hitTestOptions)
//        print(hitResults)
//
//        if hitResults.first != nil {
//            if punch {
//                playAnimation(key: "dancing")
//            } else {
//                stopAnimation(key: "dancing")
//            }
//            punch = !punch
//            return
//        }
//    }
    
//    func playAnimation(key: String) {
//        // Add the animation to start playing it right away
//        guard let animationKey = animations[key] else { return }
//        sceneView.scene.rootNode.addAnimation(animationKey, forKey: key)
//    }
//    
//    func stopAnimation(key: String) {
//        // Stop the animation with a smooth transition
//        sceneView.scene.rootNode.removeAnimation(forKey: key, blendOutDuration: CGFloat(0.5))
//    }
}
