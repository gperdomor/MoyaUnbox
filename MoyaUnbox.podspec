Pod::Spec.new do |s|
  s.name         = "MoyaUnbox"
  s.version      = "1.0.0"
  s.summary      = "Unbox bindings for Moya. Includes RxSwift and ReactiveSwift bindings as well."
  s.description  = <<-DESC
    [Unbox](https://github.com/JohnSundell/Unbox) bindings for
    [Moya](https://github.com/Moya/Moya) for easier JSON serialization.
    Includes [RxSwift](https://github.com/ReactiveX/RxSwift) and [ReactiveSwift](https://github.com/ReactiveCocoa/ReactiveSwift) bindings as well.
    Instructions on how to use it are in
    [the README](https://github.com/gperdomor/MoyaUnbox).
  DESC
  s.homepage     = "https://github.com/gperdomor/MoyaUnbox"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Gustavo Perdomo" => "gperdomor@gmail.com" }
  s.social_media_url   = ""
  
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.12"
  s.watchos.deployment_target = "3.1"
  s.tvos.deployment_target = "9.0"
  
  s.source       = { :git => "https://github.com/gperdomor/MoyaUnbox.git", :tag => s.version.to_s }

  s.requires_arc = true
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/MoyaUnbox/*.swift"
    ss.dependency "Moya", "~> 10.0.2"
    ss.dependency "Unbox", "~> 2.4"
    ss.framework = "Foundation"
  end

  s.subspec "RxSwift" do |ss|
    ss.source_files = "Sources/RxMoyaUnbox/*.swift"
    ss.dependency "MoyaUnbox/Core"
    ss.dependency "Moya/RxSwift", '~> 10.0.2'
    ss.dependency "RxSwift", "~> 4.0"
  end

  s.subspec "ReactiveSwift" do |ss|
    ss.source_files = "Sources/ReactiveMoyaUnbox/*.swift"
    ss.dependency "MoyaUnbox/Core"
    ss.dependency "Moya/ReactiveCocoa"
    ss.dependency "ReactiveSwift", "~> 1.0"
  end
end
