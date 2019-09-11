#
#  Be sure to run `pod spec lint KnobFramework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|



  spec.name         = "KnobFramework"
  spec.version      = "1.0.0"
  spec.summary      = "A custom UIControl Framework."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = "Custom UI Control Framework"

  spec.homepage     = "https://github.com/Tyfoo16/KnobControl"

  spec.license      = "MIT"

  spec.author             = { "Seto Muji" => "seto.muji1990@gmail.com" }
  # Or just: spec.author    = "Seto Muji"
  # spec.authors            = { "Seto Muji" => "seto.muji1990@gmail.com" }
  # spec.social_media_url   = "https://twitter.com/Seto Muji"

  spec.platform     = :ios, "12.0"

  spec.source       = { :git => "https://github.com/Tyfoo16/KnobControl.git", :tag => "#{spec.version}" }


  spec.source_files  = "KnobFramework"
  spec.exclude_files = "Classes/Exclude"


  
  spec.swift_version = "4.2" 

end
