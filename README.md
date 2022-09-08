# Patches

### AOSP-Krypton 12.1
- Adapt to CEZANNE
- StatusBar Lyric from [exTHmUI](https://github.com/exthmui) and [Miku-UI](https://github.com/Miku-UI)
- Maybe more...

### PixelExperience-Plus 12.1 *
- Bring back [kdrag0n](https://github.com/kdrag0n)'s fix for the QS background on light theme (Thanks to [ponces'patch](https://github.com/ponces/treble_build_pe))
- Adapt to CEZANNE
- StatusBar Lyric from [exTHmUI](https://github.com/exthmui) and [Miku-UI](https://github.com/Miku-UI)
- Fast charging node and text to be show from [mt6893](https://github.com/mt6893)
- dotQS from [dotOS](https://github.com/dotOS)
- [chaldeaprjkt](https://github.com/chaldeaprjkt)'s GameSpace from [crDroid](https://github.com/crdroidandroid)
- Maybe more...  
(Note that patches are only suitable for ___twelve-plus___ branch!)

### LineageOS 19.1
- Adapt to CEZANNE
- Support screen-off FOD
- Maybe more...

### AcmeUI taffy
- Adapt to CEZANNE
- Maybe more...

### ArrowOS 13.0
- Add udfps support and framworks dimming
- Adapt to CEZANNE
- Maybe more...
  
\* Main maintenance branch

First, please synchronize the source code of AOSP-Krypton, PixelExperience-Plus, LineageOS, AcmeUI or ArrowOS

```shell
cd sourcedirectory
```
Clone this repo

```shell
git clone https://github.com/coolscode/patches
```

Then apply the patches

```shell
bash patches/apply.sh (kosp/pe/lineage/acme/arrow)[Optional]
```

There may be more in the future...
