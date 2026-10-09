# Gradium Homebrew tap

Install the [Phonon](https://github.com/gradium-ai/xn-ptts) command on macOS or Linux:

```sh
brew install gradium-ai/tap/ptts
ptts --version
```

This formula installs the prebuilt CPU command. It does not include a model. Supply a checkpoint and a normalization language when generating speech:

```sh
ptts --dir /path/to/model --lang en --quant q8 "Hello world" -o speech.wav
```

See the [CLI guide](https://github.com/gradium-ai/xn-ptts/blob/main/docs/cli.md) for supported platforms, CPU requirements, and model options.

The formula is generated from the release archives and their SHA-256 hashes. After each native release, update `Formula/ptts.rb` from the matching `ptts.rb` release asset and verify the hashes before merging.
