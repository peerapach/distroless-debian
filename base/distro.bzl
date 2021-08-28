load("@package_bundle_amd64_debian10//file:packages.bzl", packages_amd64_debian10 = "packages")
load("@package_bundle_amd64_debian11//file:packages.bzl", packages_amd64_debian11 = "packages")
load("@package_bundle_arm64_debian10//file:packages.bzl", packages_arm64_debian10 = "packages")
load("@package_bundle_arm64_debian11//file:packages.bzl", packages_arm64_debian11 = "packages")

# debian11 is manually added to the list of distro suffixes in base/BUILD
# update this when debian11 is available for all images
DISTRO_SUFFIXES = ["_debian10"]

DISTRO_PACKAGES = {
    "amd64": {
        "_debian10": packages_amd64_debian10,
        "_debian11": packages_amd64_debian11,
    },
    "arm64": {
        "_debian10": packages_arm64_debian10,
        "_debian11": packages_arm64_debian11,
    },    
}

DISTRO_REPOSITORY = {
    "amd64": {
        "_debian10": "@amd64_debian10",
        "_debian11": "@amd64_debian11",
    },
    "arm64": {
        "_debian10": "@arm64_debian10",
        "_debian11": "@arm64_debian11",
    },    
}
