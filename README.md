# Dockerised BattleNet Prefill

[![](https://dcbadge.vercel.app/api/server/BKnBS4u?style=flat-square)](https://discord.com/invite/lancachenet)

- [GitLab repository](https://gitlab.com/kirbo/battlenet-prefill-docker)
- [GitLab CI/CD](https://gitlab.com/kirbo/battlenet-prefill-docker/-/pipelines)

## Introduction

This repository is a fork based on Jessica Smiths' (mintopia) repository: [https://github.com/mintopia/battlenet-prefill-docker](https://github.com/mintopia/battlenet-prefill-docker).

Dockerfile, docker-compose and helper scripts for running [tpill90](https://github.com/tpill90)'s [battlenet-lancache-prefill](https://github.com/tpill90/battlenet-lancache-prefill) within a docker container.

## Usage

Prerequisites

 - Git
 - Docker

Clone this repository and then use either the `BattleNetPrefill` command or `BattleNetPrefill.cmd` if you're on Windows.

```bash
git clone https://gitlab.com/kirbownz/battlenet-prefill-docker.git
cd battlenet-prefill-docker
./BattleNetPrefill list-products
```

For instructions on how to use BattleNetPrefill please read the [README on the GitHub project](https://github.com/tpill90/battlenet-lancache-prefill).

Config and cache data are written to bind-mounted volumes.

### Running without Docker-Compose

This is NOT recommended as it's more awkward, but if you *really* want to:

```bash
docker run \
  -v ${PWD}/cache:/app/cache \
  -it \
  --rm \
  kirbownz/battlenet-prefill-docker:latest \
  list-products
```

This will use the latest image from Docker hub.

## Adding as a stack on Portainer

1. Go to "Stacks" page in the menu
2. Click "+ Add stack"
3. Give it a name (e.g. "battlenet-prefill") and under "Build method" select "Repository" and paste `https://gitlab.com/kirbo/battlenet-prefill-docker` into "Repository URL"
4. Once you've done your own modifications, at the bottom of the page click "Deploy the stack"
5. Navigate to "Containers" page
6. Click on `battlenet-lancache-prefill-<name-you-gave-in-step-3>-1`  (e.g. `battlenet-lancache-prefill-battlenet-prefill-1`)
7. Click "Duplicate/Edit"
8. Scroll at the bottom of the page, next to "Command" click the "Override" button and next to that button fill in your command, for me I want to prefill Overwatch and Hots, so `prefill --nocache --products pro hero`
9. Click the "Deploy the container" which is slightly above the Command you just modified
10. Done


### Schedule the prefill

To make the prefill scheduled:
1. You need to enable and setup Edge Computing (Settings -> Edge Computing -> "Enable Edge Compute features").
2. You will need to set up the Edge Agent.
3. Once those are done, go to Edge Jobs and click "Add Edge job"
4. Give it a name, e.g. "scheduled-battlenet-prefill" 
5. Select when do you want the prefill to be run, for me I chose "Advanced configuration" and fill in the input `0 1,3,5,7,9,11,13,15,17,19,21,23 * * *` so the Battlenet prefill will be run at every odd hour
6. Under the "Web editor" add the same name you had in the bullets above on step 6, such as:
   ```
   docker start battlenet-lancache-prefill-battlenet-prefill-1
   ```
7. Select the Target environment
8. Click "Create edge job"
9. Done

## Support

For support, please visit the [LanCache.Net Discord Server](https://discord.com/invite/lancachenet) in the `#battlenet-prefill` channel.

## Thanks

This would not exist without the following:

- [Jessica Smith](https://github.com/mintopia)
- [Tim Pilius](https://github.com/tpill90)
- LanCache.Net Team
- UK LAN Techs

## License

The MIT License (MIT)

Copyright (c) 2022 Kimmo Saari

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
