# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

# Exceptions:
# - s390x doesn't have libunwind8.
#   https://github.com/GoogleContainerTools/distroless/pull/612#issue-500157699
# - ppc64le doesn't have stretch security-channel.
#   https://github.com/GoogleContainerTools/distroless/pull/637#issuecomment-728139611
# - arm needs someone with available hardware to generate:
#   //experimental/python2.7/ld.so.arm.cache

BASE_ARCHITECTURES = ["amd64", "arm64"]
ARCHITECTURES = BASE_ARCHITECTURES

VERSIONS = [
    ("debian10", "buster"),
    ("debian11", "bullseye"),
]

DEBIAN_SNAPSHOT = "20210828T025147Z"

DEBIAN_SECURITY_SNAPSHOT = "20210827T190007Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "d9c9c7624856a0b66caabdc7596d7e1dd98c3795652728f72c153417fa1aa441",
            "security": "b8e6ec7f45ad5494ebc096afe82b62a7427cfd4c8a137e0d64ce78c71542e997",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "a7f08fac43b86d7ed54b4e5a432638c138c7884bf0e325df918baac39f448b42",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "c82c25bcec6b5f2d375e30b8afb8ccf98ef3a2a20dcce1b8e6fa80562bc8195a",
            "security": "6a33cf2d8ad401de0ac2180b0b3b8c5459a87ccc11f5fb00e099ca9c8cab0c58",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "de12ddcf7038b37bfe3200a45ac4d5f0ecd9166f212f8e4329b9429f393f0969",
        },
    },    
}
