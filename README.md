# cu-ece251

> The Cooper Union - ECE 251: Computer Architecture

The following was completed under the supervision of Professor Rob
Marano for the Spring of 2022.  All distributed course material can be
found on the [course page].


## Building

You'll need the [Meson Build system] and the GNU toolchain for AArch64.

In the case that you're not building on a native AArch64 system, you'll
additionally need to pass `meson` the correct cross files.  If the
prefix for your cross-toolchain differs from `aarch64-linux-gnu`, modify
`aarch64-linux-gnu.ini` and set the `arch` constant to the correct
prefix.

```sh
meson setup build \
	--cross-file aarch64-linux-gnu.ini \
	--cross-file cross.ini
ninja -C build
```


## Copyright & Licensing

Copyright (C) 2022  Jacob Koziej [`<jacobkoziej@gmail.com>`]

Distributed under the [GPLv3] or later.


[Meson Build system]: https://mesonbuild.com/
[course page]: https://robmarano.github.io/courses/ece251/2022/ece251-syllabus-spring-2022.html
[`<jacobkoziej@gmail.com>`]: mailto:jacobkoziej@gmail.com
[GPLv3]: LICENSE.md
