# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MLWebBrowser' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    
    # Pods for MLWebBrowser
    pod 'APIKit', '~> 3.0' #网络抽象成
    pod 'Alamofire','~> 4.0.0' #网络底层框架
    pod 'SwiftyJSON', '~> 3.1.0' #JSON 解析库
    pod 'SnapKit', '~> 3.0.1' #SnapKit/SnapKit AutoLayout
    pod 'XCGLogger', '~> 4.0.0' #日志框架
    pod 'Kingfisher', '~> 3.1.0' #图片下载缓存框架
    pod 'ObjectMapper', '~> 2.0.0'
    pod 'RealmSwift'
    
    #更新swift 版本
    post_install do |installer|
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
    end
    
end
