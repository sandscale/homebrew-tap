# Copyright (c) 2026 Neural Inverse. All rights reserved.
# SPDX-License-Identifier: BUSL-1.1. See LICENSE in the project root for license information.
#
# Homebrew formula of the Sandscale CLI for the tap (github.com/sandscale/homebrew-tap: brew install sandscale/tap/sandscale).
# A template: scripts/release-sandscale.mjs replaces every placeholder (a name between at signs) from the release's SHA256SUMS and
# refuses to write the formula while one is left. Edit the template, never a rendered formula.
class Sandscale < Formula
  desc "Sandscale cloud workspaces, sandboxes, build hosts and vault from the terminal"
  homepage "https://sandscale.dev"
  version "1.2.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.2.0/sandscale-darwin-arm64"
      sha256 "aa62d1d123e34284413c0e1bd7f8a78d109a572e9420c001819fd545b4bb234e"
    end
    on_intel do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.2.0/sandscale-darwin-x64"
      sha256 "b51e9dd3906574a8ff7033f07232f4c9c598e43ca00bdde17cc8fd9f60d5bf61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.2.0/sandscale-linux-arm64"
      sha256 "61de67aa0cba6a1d5ad6c813bc8cde482e7538465f43ad91397934b226d292f6"
    end
    on_intel do
      url "https://github.com/sandscale/cli/releases/download/sandscale-cli-1.2.0/sandscale-linux-x64"
      sha256 "655a717bbdaf4cd976bdb4c9b3994e79e49948238f025d908eaaa2ec85626f18"
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
