eVY1RasPi
==========

eVY1 Scratch for Pokemiku(NSX-39) & ScrachMIDI with Timidity on Raspberry Pi Installer

# Installation

Display Usage.

```
$ cd /home/pi
$ curl https://naominix.github.io/scratchmidiinstall.sh | sh -s hoge
Invalid option
Usage: curl https://naominix.github.io/scratchmidiinstall.sh | sh             -> Install ScratchMIDI and Timidity(1Port) with so.MIDIPlugin
       curl https://naominix.github.io/scratchmidiinstall.sh | sh -s miku     -> Install eVY1 Scratch for PokeMiku(NSX-39) with so.MIDIPlugin
       curl https://naominix.github.io/scratchmidiinstall.sh | sh -s timidity -> Install Timidity(1Port) only
       curl https://naominix.github.io/scratchmidiinstall.sh | sh -s midi     -> Install ScratchMIDI with so.MIDIPlugin
```

## Install ScratchMIDI & Timidity with so.MIDIPLugin.

### Network Online

```
$ cd /home/pi
$ curl https://naominix.github.io/scratchmidiinstall.sh | sh
```

You need to reboot for changes to take effect

* Install patched so.MIDIPlugin
* Install Timidity & SoundFont
* Customize Timidity Configuration
* Change /etc/modprobe.d/alsa-base.conf (keep snd-usb-audio from beeing loaded as first soundcard)
* Install ScratchMIDI runtime environment(ScratchMIDI image & Desktop shortcut & Shell Script)

### Getting Started

1. Reboot Raspberry Pi
2. Double click ScratchMIDI icon on desktop shortcut to start ScratchMIDI
3. Let's play!

## Install eVY1RasPi Scratch.

### Network Online

```
$ cd /home/pi
$ curl https://naominix.github.io/scratchmidiinstall.sh | sh -s miku
```

* Install patched so.MIDIPlugin
* Install ja_eVY1.po
* Install eVY1 Scratch image & eVY1.desktop files

### Getting Started

1. Boot Raspberry Pi
2. After the LXDE Desktop displayed, Connect NSX-39(Pocket Miku).
3. Double click eVY1 Scratch icon on desktop shortcut to start eVY1 Scratch
4. Click Sound category, Right Click "Play Note Block" and Select MIDI device.
5. Let's play sample scratch project files (locate: /home/pi/eVY1RasPi/Projects )

## Install ScratchMIDI with so.MIDIPLugin ( without Timidity )

### Network Online

```
$ cd /home/pi
$ curl https://naominix.github.io/scratchmidiinstall.sh | sh -s midi
```

* Install patched so.MIDIPlugin
* Install ScratchMIDI runtime environment(ScratchMIDI image & Desktop shortcut & Shell Script)

### Getting Started

0. MIDI instruments connect to Raspberry Pi 
1. Double click ScratchMIDI icon on desktop shortcut to start ScratchMIDI
2. Let's play!

## Install Timidity only ( 1Port configuration )

### Network Online

```
$ cd /home/pi
$ curl https://naominix.github.io/scratchmidiinstall.sh | sh -s timidity
```

* Install Timitidy ( 1Port Configuration ) only

## Special Thanks

eVY1 Scratch : Kazuhiro Abe

Patched so.MIDIPlugin : Manabu Sugiura

## [Old]Installation

Install eVY1RasPi Scratch.

### Network Online

```
$ cd /home/pi
$ curl https://naominix.github.io/pokemikuinstall.sh | sh
```

### Network Offline

Download the Zip file from GitHub.

https://github.com/naominix/eVY1RasPi/archive/master.zip

```
$ cd /home/pi
$ unzip master.zip
$ cd eVY1RasPi-master
$ cat localinstall.sh | sh
```

Overwrite or Copy files:
* so.MIDIPlugin
* ja_eVY1.po
* eVY1.desktop

## Timidity Installer

```
$ cd /home/pi
$ curl https://naominix.github.io/timidityinstall.sh | sh
```

You need to reboot for changes to take effect

* Install Timidity & SoundFont
* Customize Timidity Configuration
* Change /etc/modprobe.d/alsa-base.conf (keep snd-usb-audio from beeing loaded as first soundcard)

