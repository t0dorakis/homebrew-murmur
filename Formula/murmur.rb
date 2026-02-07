class Murmur < Formula
  desc "Scheduled Claude prompts that only speak when something needs attention"
  homepage "https://github.com/t0dorakis/murmur"
  url "https://github.com/t0dorakis/murmur/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "56e1a9fca03e8d6cbf088da68aef4f7aa77059a826134dfaf0c98b888a6164db"
  version "0.2.1"
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
