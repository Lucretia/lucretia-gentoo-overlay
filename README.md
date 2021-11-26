# Lucretia's Gentoo overlay

You will find packages I think are useful and grabbed from various locations or created myself. Some I've grabbed, and updated myself, some are copied from Portage because they failed to build and had patches applied or updated to a newer version for when Portage catches up.

## Packages

* app-emulation/
  * [wineasio](https://gpo.zugaina.org/AJAX/Ebuild/13005980/View) (Original ebuild)
    * [1.0.0](./app-emulation/wineasio/wineasio-1.0.0.ebuild)
* media-libs/
  * [asio-sdk](https://gpo.zugaina.org/AJAX/Ebuild/38403542/View) (Original ebuild)
    * [2.3.3](./media-libs/asio-sdk/../asiosdk/asiosdk-2.3.3.ebuild)
  * vst2sdk
    * [2.4](./media-libs/vst2sdk/vst2sdk-2.4.ebuild)
  * vst3sdk
    * [3.7.1](./media-libs/vst3sdk/vst3sdk-3.7.1.ebuild)
* media-plugins/
  * [calf] (Original ebuild from Gentoo)
    * [0.90.3-r2](./media-media-plugins/calf/calf-0.90.3-r2.ebuild)
  * [gxplugins-lv2](https://gpo.zugaina.org/AJAX/Ebuild/27861632) (Original ebuild)
    * [9999](./media-plugins/gxplugins-lv2/gxplugins-lv2-9999.ebuild)
* media-gfx/
  * [flamegraph](https://data.gpo.zugaina.org/SoniFrog/media-gfx/flamegraph/) Original ebuild.
    * [1.0](./media-gfx/flamegraph/flamegraph-1.0.ebuild)
* media-sound/
  * [amsynth] (Original ebuild from Gentoo)
    * [1.12.2-r1](./media-sound/amsynth/amsynth-1.12.2-r1.ebuild)
  * [ardour] (+vst)
    * [6.9-r1](./media-sound/ardour/ardour-6.9-r1.ebuild)
  * [cadence](https://github.com/gentoo-audio/audio-overlay/blob/master/media-sound/cadence/cadence-9999-r7.ebuild) (Original ebuild)
    * [9999-r8](./media-sound/cadence/cadence-9999-r8.ebuild)
  * [carla](https://github.com/gentoo-audio/audio-overlay/blob/master/media-sound/carla/carla-9999.ebuild) (Original ebuild)
    * [2.3.2](./media-sound/carla/carla-2.3.2.ebuild)
    * [2.4.1](./media-sound/carla/carla-2.4.1.ebuild)
    * [9999-r1](./media-sound/carla/carla-9999-r1.ebuild)
  * [fluidsynth] (Original ebuild from Gentoo)
    * [2.2.3-r1](./media-sound/fluidsynth/fluidsynth-2.2.3-r1.ebuild)
    * [2.2.4-r1](./media-sound/fluidsynth/fluidsynth-2.2.4-r1.ebuild)
  * [hydrogen] (Original ebuild from Gentoo)
    * [1.1.0-r1](./media-sound/hydrogen/hydrogen-1.1.0-r1.ebuild)
  * [jack-keyboard] (Original ebuild from Gentoo)
    * [2.7.2-r2](media-sound/jack-keyboard/jack-keyboard-2.7.2-r2.ebuild)
  * [ladish](https://github.com/gentoo-audio/audio-overlay/blob/master/media-sound/ladish/ladish-1-r2.ebuild) (Original ebuild)
    * [1-r3](./media-sound/ladish/ladish-1-r3.ebuild)
  * [surge](https://github.com/gentoo-audio/audio-overlay/issues/298) (Original ebuild)
    * [1.8.1](./media-sound/surge/surge-1.8.1.ebuild)
  * [zyn-fusion](https://github.com/gentoo-audio/audio-overlay/blob/add-zyn-fusion/media-sound/zyn-fusion/zyn-fusion-3.0.5.ebuild) (Original ebuild)
    * [3.0.5](./media-sound/zyn-fusion/zyn-fusion-3.0.5.ebuild)
  * [zynaddsubfx](https://github.com/gentoo-audio/audio-overlay/blob/add-zyn-fusion/media-sound/zynaddsubfx/zynaddsubfx-3.0.5-r1.ebuild) (Original ebuild)
    * [3.0.5-r1](./media-sound/zynaddsubfx/zynaddsubfx-3.0.5-r1.ebuild)
* media-video/
  * [ndi-sdk](https://gpo.zugaina.org/AJAX/Ebuild/43486515/View) (Original ebuild)
    * [4.6.2](./media-video/ndi-sdk/ndi-sdk-4.6.2.ebuild)
  * obs-ndi
    * [9999](./media-video/obs-ndi/obs-ndi-9999.ebuild)

## TODO

* How can I get emerge to rebuild wineasio when a slotted wine-staging it removed?
