load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

[
    container_image(
        name ="java" + "_" + arch + distro_suffix,
        base="@java_distroless" + "_" + arch + distro_suffix + "//image",
        architecture = arch,
        debs=[
                DISTRO_PACKAGES[arch][distro_suffix]["libgraphite2-3"],
                DISTRO_PACKAGES[arch][distro_suffix]["libharfbuzz0b"],
                DISTRO_PACKAGES[arch][distro_suffix]["libglib2.0-0"],
                DISTRO_PACKAGES[arch][distro_suffix]["libpcre3"],
        ],
    )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]
