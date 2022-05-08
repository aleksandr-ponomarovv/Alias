//
//  CountdownTimerView.swift
//  Alias
//
//  Created by Aleksandr on 08.04.2022.
//

import UIKit

@objc protocol TimerViewDelegate: AnyObject {
    @objc optional func timerDidUpdateCounterValue(_ timer: TimerView, newValue: Int)
    @objc optional func timerDidStart(_ timer: TimerView)
    @objc optional func timerDidPause(_ timer: TimerView)
    @objc optional func timerDidResume(_ timer: TimerView)
    @objc optional func timerDidEnd(_ timer: TimerView, elapsedTime: TimeInterval)
}

class TimerView: UIView {
    
    weak var delegate: TimerViewDelegate?
    
    var lineWidth: CGFloat = 2.0
    var lineColor: UIColor = .white
    var trailLineColor: UIColor = .black
    var isLabelHidden: Bool = false
    
    var labelFont: UIFont?
    var labelTextColor: UIColor?
    var timerFinishingText: String?
    
    // use minutes and seconds for presentation
    var useMinutesAndSecondsRepresentation = false
    var moveClockWise = true
    
    var timer: Timer?
    var beginingValue: Int = 1
    var totalTime: TimeInterval = 1
    var elapsedTime: TimeInterval = 0
    var interval: TimeInterval = 1 // Interval which is set by a user
    let fireInterval: TimeInterval = 0.01 // ~60 FPS
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        addSubview(label)
        label.textAlignment = .center
        label.frame = bounds
        label.font = labelFont
        label.textColor = labelTextColor
        return label
    }()
    
    private var currentCounterValue: Int = 0 {
        didSet {
            if !isLabelHidden {
                if let text = timerFinishingText, currentCounterValue == 0 {
                    counterLabel.text = text
                } else {
                    if useMinutesAndSecondsRepresentation {
                        counterLabel.text = getMinutesAndSeconds(remainingSeconds: currentCounterValue)
                    } else {
                        counterLabel.text = "\(currentCounterValue)"
                    }
                }
            }
            delegate?.timerDidUpdateCounterValue?(self, newValue: currentCounterValue)
        }
    }
    
    override init(frame: CGRect) {
        if frame.width != frame.height {
            fatalError("Please use a rectangle frame for SRCountdownTimer")
        }
        
        super.init(frame: frame)
        
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        let radius = (rect.width - lineWidth) / 2
        
        var currentAngle: CGFloat!
        
        if moveClockWise {
            currentAngle = CGFloat((.pi * 2 * elapsedTime) / totalTime)
        } else {
            currentAngle = CGFloat(-(.pi * 2 * elapsedTime) / totalTime)
        }
        
        context?.setLineWidth(lineWidth)
        
        // Main line
        context?.beginPath()
        context?.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: radius,
            startAngle: currentAngle - .pi / 2,
            endAngle: .pi * 2 - .pi / 2,
            clockwise: false)
        context?.setStrokeColor(lineColor.cgColor)
        context?.strokePath()
        
        // Trail line
        context?.beginPath()
        context?.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: radius,
            startAngle: -.pi / 2,
            endAngle: currentAngle - .pi / 2,
            clockwise: false)
        context?.setStrokeColor(trailLineColor.cgColor)
        context?.strokePath()
    }
    
    // MARK: Public methods
    /**
     * Starts the timer and the animation. If timer was previously runned, it'll invalidate it.
     * - Parameters:
     *   - beginingValue: Value to start countdown from.
     *   - interval: Interval between reducing the counter(1 second by default)
     */
    func start(beginingValue: Int, interval: TimeInterval = 1) {
        self.beginingValue = beginingValue
        self.interval = interval
        
        totalTime = TimeInterval(beginingValue) * interval
        elapsedTime = 0
        currentCounterValue = beginingValue
        
        timer?.invalidate()
        timer = Timer(timeInterval: fireInterval, target: self, selector: #selector(TimerView.timerFired(_:)), userInfo: nil, repeats: true)
        
        guard let timer = timer else { return }
        RunLoop.main.add(timer, forMode: .common)
        
        delegate?.timerDidStart?(self)
    }
    
    /**
     * Pauses the timer with saving the current state
     */
    func pause() {
        timer?.fireDate = Date.distantFuture
        delegate?.timerDidPause?(self)
    }
    
    /**
     * Resumes the timer from the current state
     */
    func resume() {
        timer?.fireDate = Date()
        delegate?.timerDidResume?(self)
    }
    
    /**
     * Reset the timer
     */
    func reset() {
        currentCounterValue = 0
        timer?.invalidate()
        elapsedTime = 0
        setNeedsDisplay()
    }
    
    /**
     * End the timer
     */
    func end() {
        currentCounterValue = 0
        timer?.invalidate()
        
        delegate?.timerDidEnd?(self, elapsedTime: elapsedTime)
    }
}

// MARK: - Private methods
private extension TimerView {
    /**
     * Calculate value in minutes and seconds and return it as String
     */
    func getMinutesAndSeconds(remainingSeconds: Int) -> (String) {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds - minutes * 60
        let secondString = seconds < 10 ? "0" + seconds.description : seconds.description
        return minutes.description + ":" + secondString
    }
    
    @objc func timerFired(_ timer: Timer) {
        elapsedTime += fireInterval
        
        if elapsedTime <= totalTime {
            setNeedsDisplay()
            
            let computedCounterValue = beginingValue - Int(elapsedTime / interval)
            if computedCounterValue != currentCounterValue {
                currentCounterValue = computedCounterValue
            }
        } else {
            end()
        }
    }
}
