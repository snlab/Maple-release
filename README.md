# Maple Release

[![Latest Release][release]](https://github.com/snlab/Maple-release/releases)

[**CHANGELOG**](https://github.com/snlab/Maple-release/blob/master/CHANGELOG.md) | [**RELEASE**](https://github.com/snlab/Maple-release/releases)

Maple is a high-level SDN programming language. The original paper claims the basic design of Maple:

> Voellmy, A., Wang, J., Yang, Y. R., Ford, B., & Hudak, P. (2013). Maple: Simplifying SDN programming using algorithmic policies. ACM SIGCOMM Computer Communication Review, 43(4), 87-98. [[pdf]](http://conferences.sigcomm.org/sigcomm/2013/papers/sigcomm/p87.pdf)

Unfortunately, it is a close source project for some reason now. So we maintain this GitHub repository to deliver the binary version of Maple. The latest release is based on OpenDaylight Beryllium-SR3. You can download it from the [release](https://github.com/snlab/Maple-release/releases) page and try it out.

## Pre-requirements

- curl
- Git
- JAVA 1.8+
- Maven 3.3+

If your OS is Ubuntu 16.04, you can use commands as follows.

```bash
    sudo apt-get install curl git openjdk-8-jdk maven
```

## Deliverable components

- [x] Karaf package with Maple runtime Karaf features
- [x] Library to compile applications running on Maple
- [x] Maple application template generator (maven-archetype style)

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
4. ~~Check out the source code of maple-archetype from Github to `/tmp`, then compile and install it~~

And then, you can start the maple controller by using the [start script](https://raw.githubusercontent.com/snlab/Maple-release/master/utils/start_maple.sh), you will see an output as `ODLMapleProvider Session Initiated` in terminal:

```bash
    sh <(curl https://raw.githubusercontent.com/snlab/Maple-release/master/utils/start_maple.sh -L)
```

## First MapleApp

You can generate and compile your first MapleApp as follows, You can change artifactId, appName, classPrefix and copyright, but shouldn't change others.


```bash
mvn archetype:generate -DarchetypeGroupId=org.opendaylight.maple \
    -DarchetypeArtifactId=maple-archetype \
    -DarchetypeVersion=1.0.0-Beryllium-SR3 \
    -DgroupId=org.opendaylight.mapleapp \
    -DartifactId=MapleApp \
    -DappName=MapleApp \
    -DclassPrefix=MapleApp \
    -Dcopyright=None \
    -DinteractiveMode=false

cd MapleApp
mvn clean install -DskipTests
```

 Then in OpenDaylight's shell, load the MapleApp using a command just like `kar:install file:///home/.../MapleApp/features/target/mapleapp-features-1.0.0-Beryllium-SR3.kar`. Then start a Mininet's virtual environment. You will find that h1 and h3 can ping each other, but other pairs can't.


```bash
    sudo mn --topo=tree,depth=2,fanout=2 --mac --controller=remote,ip=127.0.0.1,port=6653
```

## Latest release content

| RepoName            | URI                                      | branch     |
| :--------:          | :---:                                    | :------:   |
| odlmaple (private)  | https://github.com/snlab/odlmaple        | odl-summit |
| MapleCore (private) | https://github.cm/snlab/MapleCore        | master     |
| MapleApp (private)  | https://github.com/snlab/MapleApp        | odl-summit |
| maple-archetype     | https://github.com/snlab/maple-archetype | odl-summit |


[release]: https://img.shields.io/github/release/snlab/Maple-release.svg "Latest Release"
