class DockerSshAuthSock < Formula
  desc "Use SSH Agent from macOS within Docker"
  homepage "https://punkt.de"
  url "https://raw.githubusercontent.com/punktDe/docker-mac-ssh-auth-sock/8a338065bf8e101193860ecde7c15ff4978afd44/docker-ssh-auth-sock",
      :using => :nounzip

  version "1"
  sha256 "43a5f5ea5aaa7beee03d4af34ce2bc24d2aa5aecf8ad773c4f8600baf27471d0"

  bottle :unneeded

  depends_on "socat"

  def install
    bin.install "docker-ssh-auth-sock"
  end

  plist_options :manual => "docker-ssh-auth-sock"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <false/>
        <key>ProgramArguments</key>
        <array>
            <string>#{bin}/docker-ssh-auth-sock</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
  EOS
  end
end
