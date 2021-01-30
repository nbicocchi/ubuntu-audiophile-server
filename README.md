# Ubuntu Audiophile Server

## Features

* Upnp renderer based on Ubuntu-server (low latency kernel)
* Headless operations (mpd/upmpdcli/gmediarender)
* Easy to install and maintain: all changes to the stock version are contained in this repository

## Installation

* Install a stock Ubuntu Server. This mod has been tested with Ubuntu Server 20.04 but is likely to work fine with other versions. 
* During the installation process, use the defaults, do not install any additional service, and create a user as requested. Installation of security fixes can be eventually skipped.
* Once the installation process is finished, log on the server and provide the following commands:

```
$ git https://github.com/nbicocchi/ubuntu-audiophile-server.git
$ cd ubuntu-audiophile-server
$ chmod 755 ./ubuntu-audiophile-server.sh
$ ./ubuntu-audiophile-server.sh
```

## Use

* Ubuntu Audiophile Server is ready for rendering upnp streams to usb dacs. It is compatible with standard upnp sources and controllers such as Bubble Upnp or Audirvana. 
* If using mpd, it is possible to trasfer music to ~/Music on the server (WinSCP, gFTP, CyberDuck for file transfer).
