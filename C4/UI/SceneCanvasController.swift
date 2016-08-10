//
//  SceneCanvasController.swift
//  C4iOS
//
//  Created by mainvolume on 8/10/16.
//  Copyright © 2016 C4. All rights reserved.
//

import UIKit
import SceneKit


/// The CanvasController class provides the infrastructure for managing the views of your iOS apps. A canvas controller manages a set of views that make up a portion of your app’s user interface. It is responsible for loading and disposing of those views, for managing interactions with those views, and for coordinating responses with any appropriate data objects. Canvas controllers also coordinate their efforts with other controller objects—including other view controllers—and help manage your app’s overall interface.
public class SceneCanvasController: UIViewController {
    
    
    public var scnView:SCNView!
    /// Called after the controller's view is loaded into memory.
    ///
    /// This override disables implicit CALayer animations, calls `setup()` and then re-enables animations.
    ///
    /// You should **not** override this method, instead use **setup()**.
    public override func viewDidLoad() {
        // create a new scene

        canvas.backgroundColor = C4Grey
        ShapeLayer.disableActions = true
        self.createInitialScene()
        self.setup()
        self.setupScene()
        ShapeLayer.disableActions = false
    }
    
    
    private func createInitialScene() {
        
        let scene = SCNScene()
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.camera?.usesOrthographicProjection = true
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 25)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni
        lightNode.castsShadow = true
        lightNode.position = SCNVector3(x: 0, y: 10, z: 25)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.whiteColor()
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the SCNView
        scnView = self.view as! SCNView
        scnView.jitteringEnabled = true
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = false
        // show statistics such as fps and timing information
        scnView.showsStatistics = false
        // configure the view
        scnView.backgroundColor = UIColor.clearColor()

        
    }
    /// Called during the controller's `viewDidLoad()` method.
    ///
    /// This method should be used to set up any objects or behaviours necessary when the controller's view loads.
    public func setup() {
    }
    
    
    public func setupScene() {
    }
    
    ///  Overrides default behaviour of showing the app's status bar. Defaults to `true`
    ///
    /// - returns: a boolean value representing whether or not the app should hide its status bar
    public override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
