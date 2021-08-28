workspace(name = "distroless")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "a8d6b1b354d371a646d2f7927319974e0f9e52f73a2452d2b3877118169eb6bb",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.23.3/rules_go-v0.23.3.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.23.3/rules_go-v0.23.3.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

load("//package_manager:dpkg.bzl", "dpkg_list", "dpkg_src")
load(
    "//:checksums.bzl",
    "ARCHITECTURES",
    "BASE_ARCHITECTURES",
    "DEBIAN_SECURITY_SNAPSHOT",
    "DEBIAN_SNAPSHOT",
    "SHA256s",
    "VERSIONS",
)

[
    dpkg_src(
        name = arch + "_" + name,
        arch = arch,
        distro = distro,
        sha256 = SHA256s[arch][name]["main"],
        snapshot = DEBIAN_SNAPSHOT,
        url = "https://snapshot.debian.org/archive",
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
]

[
    dpkg_src(
        name = arch + "_" + name + "_updates",
        arch = arch,
        distro = distro + "-updates",
        sha256 = SHA256s[arch][name]["updates"],
        snapshot = DEBIAN_SNAPSHOT,
        url = "https://snapshot.debian.org/archive",
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
]

[
    dpkg_src(
        name = arch + "_" + name + "_security",
        package_prefix = "https://snapshot.debian.org/archive/debian-security/{}/".format(DEBIAN_SECURITY_SNAPSHOT),
        packages_url = "https://snapshot.debian.org/archive/debian-security/{}/dists/{}/updates/main/binary-{}/Packages.xz".format(DEBIAN_SECURITY_SNAPSHOT, distro, arch),
        sha256 = SHA256s[arch][name]["security"],
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
    if "debian10" == name
    if "security" in SHA256s[arch][name]
]

# debian11 has a slightly different structure for security on snapshots
[
    dpkg_src(
        name = arch + "_" + name + "_security",
        package_prefix = "https://snapshot.debian.org/archive/debian-security/{}/".format(DEBIAN_SECURITY_SNAPSHOT),
        packages_url = "https://snapshot.debian.org/archive/debian-security/{}/dists/{}-security/main/binary-{}/Packages.xz".format(DEBIAN_SECURITY_SNAPSHOT, distro, arch),
        sha256 = SHA256s[arch][name]["security"],
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
    if "debian11" == name
    if "security" in SHA256s[arch][name]
]

[
    dpkg_src(
        name = arch + "_" + name + "_backports",
        arch = arch,
        distro = distro + "-backports",
        sha256 = SHA256s[arch][name]["backports"],
        snapshot = DEBIAN_SNAPSHOT,
        url = "https://snapshot.debian.org/archive",
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
    if "backports" in SHA256s[arch][name]
]

[
    dpkg_list(
        name = "package_bundle_" + arch + "_debian11",
        # only packages for static and base at the moment
        packages = [
            "base-files",
            "ca-certificates",
            "libc6",
            "libssl1.1",
            "netbase",
            "openssl",
            "tzdata",

            # c++
            "libgcc-s1",
            "libgomp1",
            "libstdc++6",

            # dotnet
            "libgcc-s1",
            "libgssapi-krb5-2",
            "libicu67",
            "libstdc++6",
            "zlib1g",
        ],
        sources = [
            "@" + arch + "_debian11_security//file:Packages.json",
            "@" + arch + "_debian11_updates//file:Packages.json",
            "@" + arch + "_debian11//file:Packages.json",
        ],
    )
    for arch in ARCHITECTURES
]

[
    dpkg_list(
        name = "package_bundle_" + arch + "_debian10",
        packages = [
            "libc6",
            "base-files",
            "ca-certificates",
            "openssl",
            "libssl1.1",
            "libbz2-1.0",
            "libdb5.3",
            "libffi6",
            "liblzma5",
            "libexpat1",
            "libreadline7",
            "libsqlite3-0",
            "mime-support",
            "netbase",
            "readline-common",
            "tzdata",

            #python3
            "libmpdec2",
            "libpython3.7-minimal",
            "libpython3.7-stdlib",
            "libtinfo6",
            "libuuid1",
            "libncursesw6",
            "python3-distutils",
            "python3.7-minimal",

            # dotnet
            "libgcc1",
            "libgssapi-krb5-2",
            "libicu63",
            "libstdc++6",
            "zlib1g",
        ] + (["libunwind8"] if arch in BASE_ARCHITECTURES else []),
        sources = [
            "@" + arch + "_debian10_security//file:Packages.json",
            "@" + arch + "_debian10_updates//file:Packages.json",
            "@" + arch + "_debian10//file:Packages.json",
        ],
    )
    for arch in ARCHITECTURES
]

# For the dotnet 5 image
http_archive(
    name = "aspnetcore_runtime5_amd64",
    build_file = "//dotnet/5:BUILD.dotnet",
    sha256 = "b6cba668bf18981d2274d093a7acaedcd06fbf1929c864650f22f3cf3313481c",
    # strip_prefix = "aspnetcore-runtime-5.0.9-linux-x64/",
    type = "tar.gz",
    urls = ["https://download.visualstudio.microsoft.com/download/pr/19046594-e911-4784-a148-6de3d74d4a7f/d5c1ba792c4266a2d2a8eea41e81a060/aspnetcore-runtime-5.0.9-linux-x64.tar.gz"],
)

http_archive(
    name = "aspnetcore_runtime5_arm64",
    build_file = "//dotnet/5:BUILD.dotnet",
    sha256 = "f1c8486cf0d751447ef8e152fb17e6d4552f2337799625424f403b00ce75801b",
    type = "tar.gz",
    urls = ["https://download.visualstudio.microsoft.com/download/pr/0e3da9ad-b838-419a-8ad5-caaff159083f/484d306f2778f15519201178961372bc/aspnetcore-runtime-5.0.9-linux-arm64.tar.gz"],
)

# Docker rules.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "59d5b42ac315e7eadffa944e86e90c2990110a1c8075f1cd145f487e999d22b3",
    strip_prefix = "rules_docker-0.17.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.17.0/rules_docker-v0.17.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "base_distroless_amd64_debian10",
    registry = "gcr.io",
    repository = "distroless/base-debian10",
    tag = "debug"
)

container_pull(
    name = "base_distroless_amd64_debian11",
    registry = "gcr.io",
    repository = "distroless/base-debian11",
    tag = "latest"
)

container_pull(
    name = "base_distroless_arm64_debian10",
    registry = "gcr.io",
    repository = "distroless/base-debian10",
    tag = "latest-arm64"
)

container_pull(
    name = "base_distroless_arm64_debian11",
    registry = "gcr.io",
    repository = "distroless/base-debian11",
    tag = "latest-arm64"
)