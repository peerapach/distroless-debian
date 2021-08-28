# load("@depends_python_gmpy2_debian_buster//debs:deb_packages.bzl", "depends_python_gmpy2_debian_buster")
# load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

[
  container_image(
    name ="dotnet_depends" + "_" + arch + distro_suffix,
    base="@base_distroless" + "_" + arch + distro_suffix + "//image",
    architecture = arch,
    tars = ["@aspnetcore_runtime5_" + arch + "//:tar", "@aspnetcore_runtime5_" + arch + "//:tar_bin"],
    # symlinks = { "/usr/bin/dotnet": "/usr/share/dotnet/dotnet" },
    env = {
      "ASPNETCORE_URLS": "http://+:8080",
      "DOTNET_RUNNING_IN_CONTAINER": "true",
      "DOTNET_VERSION": "5.0.9",
    },
    debs=[
              DISTRO_PACKAGES[arch][distro_suffix]["libgcc1"],
              DISTRO_PACKAGES[arch][distro_suffix]["libgssapi-krb5-2"],
              DISTRO_PACKAGES[arch][distro_suffix]["libicu63"],
              DISTRO_PACKAGES[arch][distro_suffix]["libstdc++6"],
              DISTRO_PACKAGES[arch][distro_suffix]["zlib1g"],              
    ],
  )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]
