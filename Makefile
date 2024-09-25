TARGET = Movies
TEST_TARGET = MoviesTests

IOS_DESTINATION = 'platform=iOS Simulator,name=iPhone 15,OS=18.0'
WATCHOS_DESINTATION = 'platform=watchOS Simulator,name=Apple Watch Series 9 (45mm),OS=11.0'
TVOS_DESTINATION = 'platform=tvOS Simulator,name=Apple TV 4K (3rd generation),OS=18.0'
VISIONOS_DESTINATION = 'platform=visionOS Simulator,name=Apple Vision Pro,OS=2.0'

.PHONY: clean
clean:
	xcodebuild clean

.PHONY: format
format:
	swiftlint --fix
	swiftformat .

.PHONY: lint
lint:
	swiftlint --strict
	swiftformat --lint .

.PHONY: build-ios
build-ios:
	set -o pipefail && NSUnbufferedIO=YES xcodebuild clean build -scheme $(TARGET) -destination $(IOS_DESTINATION)

.PHONY: test-ios
test-ios:
	set -o pipefail && NSUnbufferedIO=YES xcodebuild clean build-for-testing -scheme $(TARGET) -only-testing $(TEST_TARGET) -destination $(IOS_DESTINATION)
	set -o pipefail && NSUnbufferedIO=YES xcodebuild test-without-building -scheme $(TARGET) -only-testing $(TEST_TARGET) -destination $(IOS_DESTINATION)

