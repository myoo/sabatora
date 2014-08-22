Obscenity.configure do |config|
  config.blacklist   = "config/blacklist.yml"
  config.whitelist   = ["safe", "word"]
  config.replacement = :stars
end
