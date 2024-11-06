# proof of build
1. $ aiken add aiken-lang/fuzz --version v2
      Package aiken-lang/fuzz
        Added version → v2
2. $ aiken build
    Compiling aiken-lang/nft_minting 0.0.0 (.)
    Resolving dependencies
    Resolving aiken-lang/nft_minting
      Fetched 2 packages in 1.76s from cache
    Compiling aiken-lang/stdlib v2.1.0 (./build/packages/aiken-lang-stdlib)
    Compiling aiken-lang/fuzz v2 (./build/packages/aiken-lang-fuzz)
   Generating project's blueprint (./plutus.json)
      Summary 0 errors, 0 warnings
3. $ aiken check
   nft_minting fahimahamed$ aiken check
    Compiling aiken-lang/nft_minting 0.0.0 (.)
    Resolving aiken-lang/nft_minting
      Fetched 1 package in 0.01s from cache
    Compiling aiken-lang/stdlib v2.1.0 (./build/packages/aiken-lang-stdlib)
    Compiling aiken-lang/fuzz v2 (./build/packages/aiken-lang-fuzz)
      Summary 0 errors, 0 warnings
