# Maple Release

[**CHANGELOG**](https://github.com/snlab/Maple-release/blob/master/CHANGELOG.md) | [**RELEASE**](https://github.com/snlab/Maple-release/releases)

Maple is a high-level SDN programming language. The original paper claims the basic design of Maple:

> Voellmy, A., Wang, J., Yang, Y. R., Ford, B., & Hudak, P. (2013). Maple: Simplifying SDN programming using algorithmic policies. ACM SIGCOMM Computer Communication Review, 43(4), 87-98. [[pdf]](conferences.sigcomm.org/sigcomm/2013/papers/sigcomm/p87.pdf)

Unfortunately, it is a close source project for some reason now. So we maintain this github repository to deliver the binary version of Maple. The latest release is based on OpenDaylight Beryllium-SR2. You can download it from the [release](https://github.com/snlab/Maple-release/releases) page and try it out.

## Pre-requirements

- JAVA 1.8+
- Maven 3.3.3+

## Deliverable components

- [x] Karaf package with Maple runtime karaf features
- [ ] Compile library to build applications run on Maple
- [ ] Maple application template generator (maven-archetype style)

## Quick start

Download the latest release from the [release](https://github.com/snlab/Maple-release/releases) list.

    curl -L -o maple-latest.zip $(curl -s https://api.github.com/repos/snlab/Maple-release/releases | grep browser_download_url | head -n 1 | cut -d '"' -f 4)

Uncompress the zip file.

    unzip maple-latest.zip

Start the karaf service.

    maple-{version}/bin/karaf

## Latest release content

| RepoName            | URI                                      | branch     |
| :--------:          | :---:                                    | :------:   |
| odlmaple (private)  | https://github.com/snlab/odlmaple        | odl-summit |
| MapleCore (private) | https://github.cm/snlab/MapleCore        | master     |
| MapleApp            | https://github.com/snlab/MapleApp        | odl-summit |
| maple-archetype     | https://github.com/snlab/maple-archetype | master     |
