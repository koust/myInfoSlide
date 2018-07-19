Pod::Spec.new do |s|
s.name         = "myInfoSlide"
s.version      = "1.0.1"
s.summary      = "Presentation helps you to make tutorials, release notes and animated pages.."
s.license      = { :type => 'MIT License', :file => 'LICENSE' }
s.homepage     = "https://github.com/koust/myInfoSlide"
s.screenshots  = "https://github.com/koust/myInfoSlide/raw/master/gorsel.gif"
s.author       = { "koust" => "https://github.com/koust" }
s.platform     = :ios, "9.0"
s.swift_version = "4.0"
s.source       = { :git => "https://github.com/koust/myInfoSlide.git", :tag => s.version }
s.source_files  = "myInfoSlide/myInfoSlideController.swift"
s.resources = 'myInfoSlide/Assets/*'
s.resource_bundles = {
'SwiftWebVCResources' => ['SwiftWebVC/Assets/*']
}
s.requires_arc = true
end
