class Murmur < Formula
  desc "Scheduled Claude prompts that only speak when something needs attention"
  homepage "https://github.com/t0dorakis/murmur"
  url "https://github.com/t0dorakis/murmur/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "f72abb83165458e8d1e98f319b0a1a4dbf68544ce733bccf9f9a7ff34f0aa198"
  version "0.4.0"
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
