class Murmur < Formula
  desc "Scheduled Claude prompts that only speak when something needs attention"
  homepage "https://github.com/t0dorakis/murmur"
  url "https://github.com/t0dorakis/murmur/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "cdc0a4ac0d6d8235cc09c9b21fc105b19ac1c5e4fa7bc1880a86e4685885b843"
  version "0.4.1"
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
