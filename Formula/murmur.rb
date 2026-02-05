class Murmur < Formula
  desc "Scheduled Claude prompts that only speak when something needs attention"
  homepage "https://github.com/t0dorakis/murmur"
  url "https://github.com/t0dorakis/murmur/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a1c8b5903f6130b746ec3b74df2af12eb2c3289e123831198960697b7ce8c511"
  version "0.2.0"
  license "MIT"

  depends_on "bun"

  def install
    system "bun", "install"
    system "bun", "build", "--compile", "src/cli.ts", "--outfile", "murmur"
    bin.install "murmur"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/murmur --version")
  end
end
