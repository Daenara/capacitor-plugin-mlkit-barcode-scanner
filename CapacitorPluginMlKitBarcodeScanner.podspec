require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name = 'CapacitorPluginMlKitBarcodeScanner'
  s.version = package['version']
  s.summary = package['description']
  s.license = package['license']
  s.homepage = package['repository']['url']
  s.author = package['author']
  s.source = { :git => package['repository']['url'], :tag => s.version.to_s }
  s.static_framework = true
  s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.ios.deployment_target  = '15.0'
  s.dependency 'Capacitor'
  s.dependency 'GoogleMLKit/BarcodeScanning', '~> 5.0.0'
  s.swift_version = '5.1'
  s.resources = [ 'ios/Plugin/**/*.xcassets']
end
