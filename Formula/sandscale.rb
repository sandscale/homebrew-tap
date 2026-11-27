# Copyright (c) 2026 Neural Inverse. All rights reserved.
# SPDX-License-Identifier: BUSL-1.1. See LICENSE in the project root for license information.
#
# Homebrew formula of the Sandscale CLI for the tap (github.com/sandscale/homebrew-tap: brew install sandscale/tap/sandscale).
# A template: scripts/release-sandscale.mjs replaces every placeholder (a name between at signs) from the release's SHA256SUMS and
# refuses to write the formula while one is left. Edit the template, never a rendered formula.
class Sandscale < Formula
  desc "Sandscale cloud workspaces, sandboxes, build hosts and vault from the terminal"
  homepage "https://sandscale.dev"
  version "1.3.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.3.0/sandscale-darwin-arm64"
      sha256 "a502f18fd4980779e844c0466a90e6216a23e9ab8323d0639608009cd6cd62ae"
    end
    on_intel do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.3.0/sandscale-darwin-x64"
      sha256 "12306a816f33bda235b177def9e8cf275bc47348fc7a5b62b161eb7a1b1d2027"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.3.0/sandscale-linux-arm64"
      sha256 "9f2f59a13f0c7e84ad1f0c81f31a91d80ccfd1589522b2cea63f5ea647a6a634"
    end
    on_intel do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.3.0/sandscale-linux-x64"
      sha256 "fde73122db40276551fcacadb2f99b10f45b9329e40578d0fd11263d1e7e6e40"
    end
  end

  def install
    # The download is the executable itself, named after its asset.
    bin.install Dir["sandscale-*"].first => "sandscale"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/sandscale --version").strip
    assert_match "sandscale <command>", shell_output("#{bin}/sandscale help")
  end
end
