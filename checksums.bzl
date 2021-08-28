# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

# BASE_ARCHITECTURES = ["amd64", "arm64"]

# Exceptions:
# - s390x doesn't have libunwind8.
#   https://github.com/GoogleContainerTools/distroless/pull/612#issue-500157699
# - ppc64le doesn't have stretch security-channel.
#   https://github.com/GoogleContainerTools/distroless/pull/637#issuecomment-728139611
# - arm needs someone with available hardware to generate:
#   //experimental/python2.7/ld.so.arm.cache
# ARCHITECTURES = BASE_ARCHITECTURES + ["arm", "s390x", "ppc64le"]

BASE_ARCHITECTURES = ["amd64", "arm64"]
ARCHITECTURES = BASE_ARCHITECTURES

VERSIONS = [
    ("debian10", "buster"),
    ("debian11", "bullseye"),
]

DEBIAN_SNAPSHOT = "20210827T083728Z"

DEBIAN_SECURITY_SNAPSHOT = "20210827T143354Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "d9c9c7624856a0b66caabdc7596d7e1dd98c3795652728f72c153417fa1aa441",
            "security": "129275d08d6a6ea3def0eb809d858bcf787f4f1c5b4af337d1ad63f2539b2517",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "1fc9787bca658f6ad044ae7ec430a5d1fafd9e4f4690e3e60d1937ed675a2fdf",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "c82c25bcec6b5f2d375e30b8afb8ccf98ef3a2a20dcce1b8e6fa80562bc8195a",
            "security": "ef2ea30f6951516989346b598eb94f793b9c7e15794a96307650eabbfc16b19b",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "f929c3409c330179b301dabd97c10b6caab3bf78eee18fa72c4c0e3f28fa831f",
        },
    },    
}
