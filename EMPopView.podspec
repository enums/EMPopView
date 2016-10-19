Pod::Spec.new do |spec|
  spec.name         = 'EMPopView'
  spec.version      = '1.0'
  spec.license      = { :type => "MIT" }
  spec.summary      = 'A popview framework for iOS writen by Swift 3.0.'
  spec.homepage     = 'https://github.com/trmbhs/EMPopView'
  spec.author       = { "Enum" => "trmbhs@icloud.com" }
  spec.ios.deployment_target = "10.0"
  spec.source       = { :git => 'https://github.com/trmbhs/EMPopView.git', :tag => spec.version }
  spec.source_files = 'EMPopView/*'
  spec.requires_arc = true
  spec.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '3.0',
  }
end