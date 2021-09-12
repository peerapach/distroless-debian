load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

[
  container_image(
    name ="dotnet5.0" + "_" + arch + distro_suffix,
    base="@base_distroless" + "_" + arch + distro_suffix + "//image",
    architecture = arch,
    tars = ["@aspnetcore_runtime5_" + arch + "//:tar"],
    symlinks = { "/usr/bin/dotnet": "/usr/share/dotnet/dotnet" },
    env = {
      "ASPNETCORE_URLS": "http://+:8080",
      "DOTNET_RUNNING_IN_CONTAINER": "true",
      "DOTNET_VERSION": "5.0.9",
    },
    debs=[
              "@//dotnet/5.0:libgdiplus_6.0.5-0xamarin1+debian10b1_amd64.deb",
              # "@libgdiplus_debian10_amd64//file",
              DISTRO_PACKAGES[arch][distro_suffix]["libgcc1"],
              DISTRO_PACKAGES[arch][distro_suffix]["libgssapi-krb5-2"],
              DISTRO_PACKAGES[arch][distro_suffix]["libicu63"],
              DISTRO_PACKAGES[arch][distro_suffix]["libstdc++6"],
              DISTRO_PACKAGES[arch][distro_suffix]["zlib1g"],
              DISTRO_PACKAGES[arch][distro_suffix]["libcairo2"],
              DISTRO_PACKAGES[arch][distro_suffix]["libexif12"],
              DISTRO_PACKAGES[arch][distro_suffix]["libfontconfig1"],
              DISTRO_PACKAGES[arch][distro_suffix]["libfreetype6"],
              DISTRO_PACKAGES[arch][distro_suffix]["libgif7"],
              DISTRO_PACKAGES[arch][distro_suffix]["libglib2.0-0"],
              DISTRO_PACKAGES[arch][distro_suffix]["libjpeg62-turbo"],
              DISTRO_PACKAGES[arch][distro_suffix]["libpng16-16"],
              DISTRO_PACKAGES[arch][distro_suffix]["libtiff5"],
              DISTRO_PACKAGES[arch][distro_suffix]["libx11-6"],
              DISTRO_PACKAGES[arch][distro_suffix]["sensible-utils"],
              DISTRO_PACKAGES[arch][distro_suffix]["ucf"],
              DISTRO_PACKAGES[arch][distro_suffix]["fonts-dejavu-core"],
              DISTRO_PACKAGES[arch][distro_suffix]["fontconfig-config"],
              DISTRO_PACKAGES[arch][distro_suffix]["libbsd0"],
              DISTRO_PACKAGES[arch][distro_suffix]["libexpat1"],
              DISTRO_PACKAGES[arch][distro_suffix]["libpixman-1-0"],
              DISTRO_PACKAGES[arch][distro_suffix]["libxau6"],
              DISTRO_PACKAGES[arch][distro_suffix]["libxdmcp6"],
              DISTRO_PACKAGES[arch][distro_suffix]["libxcb1"],
              DISTRO_PACKAGES[arch][distro_suffix]["libx11-data"],
              DISTRO_PACKAGES[arch][distro_suffix]["libxcb-render0"],
              DISTRO_PACKAGES[arch][distro_suffix]["libxcb-shm0"],
              DISTRO_PACKAGES[arch][distro_suffix]["libxext6"],
              DISTRO_PACKAGES[arch][distro_suffix]["libxrender1"],
              DISTRO_PACKAGES[arch][distro_suffix]["libjbig0"],
              DISTRO_PACKAGES[arch][distro_suffix]["libwebp6"],
              DISTRO_PACKAGES[arch][distro_suffix]["libk5crypto3"],
              DISTRO_PACKAGES[arch][distro_suffix]["libkeyutils1"],
              DISTRO_PACKAGES[arch][distro_suffix]["libkrb5-3"],
              DISTRO_PACKAGES[arch][distro_suffix]["libkrb5support0"],
              DISTRO_PACKAGES[arch][distro_suffix]["libcom-err2"],
    ],
  )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]
