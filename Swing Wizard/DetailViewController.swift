//
//  DetailViewController.swift
//  master
//
//  Created by Alex Chandy on 2/12/19.
//  Copyright © 2019 Alex Chandy. All rights reserved.
//

import UIKit
import WebKit
import YoutubePlayer_in_WKWebView



class DetailViewController: UIViewController {

    

    @IBOutlet weak var vid1: WKYTPlayerView!
    @IBOutlet weak var vid2: WKYTPlayerView!
    @IBOutlet weak var vid3: WKYTPlayerView!
    @IBOutlet weak var vid4: WKYTPlayerView!
    
    
    
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var zoneLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    
    @IBOutlet weak var hyperLinks: UITextView!
    
//   @IBOutlet weak var problemLabel: UILabel!
//    @IBOutlet weak var fieldLabel: UILabel!
//    @IBOutlet weak var zoneLabel: UILabel!
//    @IBOutlet weak var typeLabel: UILabel!
//    @IBOutlet weak var hyperLinks: UITextView!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            
            let sProblem = detail.problem
            let sField = detail.field
            let sZone = detail.zone
            let sType = detail.type
            
            if let label = problemLabel {
                label.text = sProblem
            }
            if let label = fieldLabel {
                label.text = sField
            }
            if let label = zoneLabel {
                label.text = sZone
            }
            if let label = typeLabel {
                label.text = sType
            }
//            if let view = hyperLinks {
//                for (problem,pLinks) in problemType
//                {
//                    if sProblem == problem {
//                       view.text = pLinks.joined(separator:" ")
//                    }
//                }
//            }
        }

    }
    
//    var problem1 = ["link1.1", "link1.2", "link1.3", "link1.4"]
//    var problem2 = ["link2.1", "link2.2", "link2.3", "link2.4"]
//    var problem3 = ["link3.1", "link3.2", "link3.3", "link3.4"]
//    var problem4 = ["link4.1", "link4.2", "link4.3", "link4.4"]
//    var fieldLinks = ["link1", "link2", "link3"]
    
    var problemType = ["Trouble Hitting for Power": "ne874jBGYEc",
                       "Trouble Making Contact":"YAIEMtAgbQA",
                       "Too Many Groundballs":"1mr_LcwzvB4",
                       "Too Many Flyballs":"d9fEHydJcOQ"]
    var fieldArea = ["Pull Side":"uVofjq5IC5w", "Push Side":"OhWNIpPlcgA"]
    var zoneArea = ["High":"AyXaOtquLck", "Inside":"k2N_v7s2NFI", "Outside":"DJ7iwSrkkjw", "Low":"4nSvsgI3Jgs"]
    var pitchType = ["Fastballs":"uO2KugcJ-fU", "Breaking Balls":"5mZ2I0g8lp4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if let detail = detailItem {
            let sProblem = detail.problem
            let sField = detail.field
            let sZone = detail.zone
            let sType = detail.type
//            if let view = hyperLinks {
//                for (problem,pLinks) in problemType
//                {
//                    if sProblem == problem {
//                        view.text = pLinks.joined(separator:" ")
//                    }
//                }
//            }
            var id1: String
            var id2: String
            var id3: String
            var id4: String
            for (problem, pLink) in problemType
            {
                if sProblem == problem {
                    id1 = pLink
                    vid1.load(withVideoId: id1)
                }
            }
            for (field, fLink) in fieldArea
            {
                if sField == field {
                    id2 = fLink
                    vid2.load(withVideoId: id2)
                }
            }
            for (zone, zLink) in zoneArea
            {
                if sZone == zone {
                    id3 = zLink
                    vid3.load(withVideoId: id3)
                }
            }
            for (type, tLink) in pitchType
            {
                if sType == type {
                    id4 = tLink
                    vid4.load(withVideoId: id4)
                }
            }
        }
        
        configureView()
       
        //getVideo(videoCode: "yjuJ8Rr3f0M")
    }

//    @IBOutlet weak var webView1: WKWebView!
//
//    //    @IBOutlet weak var webView1: UIWebView!
//    func getVideo(videoCode: String) {
//        let yturl = URL(string: "https://www.youtube.com/embed/\(videoCode)")
//        webView1.load(URLRequest(url: yturl!))
//
//    }
    
    var detailItem: Item? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

