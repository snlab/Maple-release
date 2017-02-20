# Maple Release

[**CHANGELOG**](https://github.com/snlab/Maple-release/blob/master/CHANGELOG.md) | [**RELEASE**](https://github.com/snlab/Maple-release/releases)

Maple is a high-level SDN programming language. The original paper claims the basic design of Maple:

> Voellmy, A., Wang, J., Yang, Y. R., Ford, B., & Hudak, P. (2013). Maple: Simplifying SDN programming using algorithmic policies. ACM SIGCOMM Computer Communication Review, 43(4), 87-98. [[pdf]](conferences.sigcomm.org/sigcomm/2013/papers/sigcomm/p87.pdf)

Unfortunately, it is a close source project for some reason now. So we maintain this github repository to deliver the binary version of Maple. The latest release is based on OpenDaylight Beryllium-SR3. You can download it from the [release](https://github.com/snlab/Maple-release/releases) page and try it out.

## Pre-requirements

- JAVA 1.8+
- Maven 3.3+

## Deliverable components

- [x] Karaf package with Maple runtime karaf features
- [x] Library to compile applications running on Maple
- [ ] Maple application template generator (maven-archetype style)

## Quick start

The easiest way to install Maple is to use our [automatic installer](https://raw.githubusercontent.com/snlab/Maple-release/master/utils/install.sh) by simply copying and pasting the following line into a terminal:

```bash
    curl https://raw.githubusercontent.com/snlab/Maple-release/master/utils/install.sh -L > install.sh && sh install.sh
```

If you have a bash-compatible shell, you can run this script:

```bash
    sh <(curl https://raw.githubusercontent.com/snlab/Maple-release/master/utils/install.sh -L)
```

It will do the following things:

1. Download the zip file of the latest maple release into `/tmp`
2. Unzip the latest maple release into `$HOME/.maple/`
3. Download and uncompress maven `settings.xml` and maple library into `$HOME/.m2/`

And then, you can start the maple controller by using the [start script](https://raw.githubusercontent.com/snlab/Maple-release/master/utils/start_maple.sh):

```bash
    sh <(curl https://raw.githubusercontent.com/snlab/Maple-release/master/utils/start_maple.sh -L)
```

## Latest release content

| RepoName            | URI                                      | branch     |
| :--------:          | :---:                                    | :------:   |
| odlmaple (private)  | https://github.com/snlab/odlmaple        | odl-summit |
| MapleCore (private) | https://github.cm/snlab/MapleCore        | master     |
| MapleApp            | https://github.com/snlab/MapleApp        | odl-summit |
| maple-archetype     | https://github.com/snlab/maple-archetype | master     |
