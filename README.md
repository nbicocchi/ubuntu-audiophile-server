# Ubuntu Audiophile Server

## Features

* Headless upnp renderer based on mdp
* Based on stock Ubuntu Server
* Easy to install and maintain
* All changes to the stock version are visible and contained in this repository

## Installation

* Install on your machine a plain Ubuntu Server. This mod has been tested with Ubuntu Server 20.04 but should work fine with other versions. 
* During the installation process, use the defaults, do not install any additional service, and create a user as requested. Installation of security fixes can be eventually skipped.
* Log on the machine and provide the following commands:

```
$ git https://github.com/nbicocchi/...
$ cd ubuntu-audiophile-server.sh
$ chmod 755 ./ubuntu-audiophile-server.sh
$ ./ubuntu-audiophile-server.sh
```

## Use

* The machine is ready for render music to your dac (Bubble Upnp, Audirvana). I designed it as a pure upnp audio renderer.
* Eventually, copy your music to /home/your_username/Music and will be seen by mpd (WinSCP, gFTP, CyberDuck)