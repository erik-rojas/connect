import AppKit

public class ToggleMenuItem: NSMenuItem {
    public override func awakeFromNib() {
        super.awakeFromNib()
        workaroundOnOfStateImageNotUpdating()
    }
    
    private func workaroundOnOfStateImageNotUpdating() {
        image = NSImage(size: NSSize(width: 1, height: 1))
    }
}
