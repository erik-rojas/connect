import Nimble
import Quick
import Testable

class ToggleMenuItemSpec: QuickSpec {
    override func spec() {
        describe("ToggleMenuItem") {
            var subject: ToggleMenuItem!
            beforeEach {
                subject = .init()
            }
            context("awakeFromNib") {
                it("should set smallest empty image") {
                    expect(subject.image).to(beNil())
                    subject.awakeFromNib()
                    expect(subject.image?.size) == NSSize(width: 1, height: 1)
                    expect(subject.image?.tiffRepresentation).to(beNil())
                    expect(subject.image?.representations).to(beEmpty())
                }
            }
        }
    }
}
