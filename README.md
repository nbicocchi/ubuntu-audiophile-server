# Ubuntu Audiophile Server

## Features

* Upnp renderer based on Ubuntu-server (low latency kernel) and mpd
* Replaces the (noisy) USB cable between PC/Mac and DAC with an ethernet cable (less noisy). For optimal performance, power the server with a dedicated linear PSU.
* Headless, stripped down
* Includes music optimizations already tested in AP-Linux and RaspyFi
* Easy to install and maintain: all changes to the stock version are contained in this repository

## Installation

* Install on your machine a plain Ubuntu Server. This mod has been tested with Ubuntu Server 20.04 but should work fine with other versions. 
* During the installation process, use the defaults, do not install any additional service, and create a user as requested. Installation of security fixes can be eventually skipped.
* Once the installation process is finished, log on the server and provide the following commands:

```
$ git https://github.com/nbicocchi/ubuntu-audiophile-server.git
$ cd ubuntu-audiophile-server
$ chmod 755 ./ubuntu-audiophile-server.sh
$ ./ubuntu-audiophile-server.sh
$ [sudo] password for username: ...
```

## Use

* The server is ready for render upnp streams to your dac. It is compatible with standard upnp sources and controllers such as Bubble Upnp or Audirvana. 
* Despite I designed it as a pure upnp audio renderer, it is possible to copy your music to /home/your_username/Music and will be seen by mpd. For transferring music you can use popular software such as WinSCP, gFTP, CyberDuck.
