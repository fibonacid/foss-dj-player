# Maintainers

This doc is for maintainers of this repo

## Node.js

Some aspect of the codebase are administered with Node.js.
To use node, the recommended approach is to download and install [nvm](https://github.com/nvm-sh/nvm)
After installing nvm, open a terminal in the repository root and run:

```bash
nvm use
corepack enable
corepack up
pnpm install
```

If everything is ok you can now run commands like these:

```bash
pnpm format
```

## Python

The script folder contains several python files that should be run with [uv](https://docs.astral.sh/uv/getting-started/installation/#standalone-installer)

```bash
# generate bom and put into public docs
pnpm scripts:bom
```

## Docker

To build RPI images we use docker. Install a recent version and refer to the `rpi` folder for details.
