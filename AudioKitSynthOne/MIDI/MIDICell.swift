//
//  MIDICell.swift
//  AudioKitSynthOne
//
//  Created by AudioKit Contributors on 11/11/17.
//  Copyright © 2017 AudioKit Pro. All rights reserved.
//

import UIKit

class MIDICell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    var currentInput: MIDIInput?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        // set cell selection color
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor.clear
        selectedBackgroundView = selectedView

        cellLabel?.textColor = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state

        if selected {
           // cellLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        } else {
            //cellLabel?.textColor = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)
            backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        }

    }

    func configureCell(midiInput: MIDIInput) {
        guard midiInput.name != "AudioKit Synth One" else { return }
        currentInput = midiInput
        cellLabel.text = "\(midiInput.name)"
        accessoryType = midiInput.isOpen ? .checkmark : .none
    }
}
