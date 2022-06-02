class DockerSshAuthSock < Formula
  desc "Use SSH Agent from macOS within Docker"
  homepage "https://punkt.de"
  url "https://raw.githubusercontent.com/punktDe/docker-mac-ssh-auth-sock/e2abded95bd104ec10e8d98fb1303b5f890e42cb/docker-ssh-auth-sock",
      :using => :nounzip

  version "2"
  sha256 "e06312bee8ad5161f8a1bb4c0ac52cbc51c3411f68b49ee385146501b8771fa1"

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
