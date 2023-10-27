Pod::Spec.new do |spec|

  spec.name         = "MFNetworking"
  spec.version      = "1.0.0"
  spec.summary      = "MFNetworking is network manager allow to request with multipart"
  spec.description  = "MFNetworking is network manager allow to request with multipart and support combine frameworks"
  spec.homepage     = "https://github.com/afathe7090/MFNetworking"
  spec.license      = "MIT"
  spec.author       = { "Ahmed Fathy" => "afathe7090" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/afathe7090/MFNetworking.git", :tag => spec.version.to_s }
  spec.source_files   = "MFNetworking/Sources/MFNetworking/**/*.{swift}"
  spec.swift_versions = "5.9"

end
