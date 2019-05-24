Pod::Spec.new do |spec|
  spec.name = 'CryptoBLS.swift'
  spec.module_name = 'CryptoBLS'
  spec.version = '1.1'
  spec.summary = 'Crypto library BLS verification for Swift'
  spec.description = <<-DESC
                       CryptoBLS includes crypto verification function that can be used in pure Swift. It uses c++ code from https://github.com/Chia-Network/bls-signatures.
                       ```
                    DESC
  spec.homepage = 'https://github.com/ant013/crypto-bls-ios'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { 'Horizontal Systems' => 'hsdao@protonmail.ch' }
  spec.social_media_url = 'http://horizontalsystems.io/'

  spec.requires_arc = true
  spec.source = { git: 'https://github.com/ant013/crypto-bls-ios.git', tag: "#{spec.version}" }
  spec.source_files = 'CryptoBLS/**/*.{h,m,mm,swift}'
  spec.module_map = 'CryptoBLS/CryptoBLS.modulemap'
  spec.ios.deployment_target = '11.0'
  spec.swift_version = '5'

  spec.pod_target_xcconfig = { 'SWIFT_WHOLE_MODULE_OPTIMIZATION' => 'YES',
                               'APPLICATION_EXTENSION_API_ONLY' => 'YES',
                               'SWIFT_INCLUDE_PATHS' => '${PODS_ROOT}/CryptoBLS.swift/Libraries',
                               'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/CryptoBLS.swift/Libraries/bls/include" "${PODS_ROOT}/CryptoBLS.swift/Libraries/bls/include/relic"',
                               'LIBRARY_SEARCH_PATHS' => '"${PODS_ROOT}/CryptoBLS.swift/Libraries/bls/lib"' }
  spec.preserve_paths = ['Libraries']

end
