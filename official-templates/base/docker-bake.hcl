variable "RELEASE" {
    default = "0.6.2"
}

group "default" {
    targets = ["rocm"]
}

target "rocm" {
    dockerfile = "Dockerfile"
    tags = ["mwiki/base:${RELEASE}-rocm"]
    contexts = {
        scripts = "../../container-template"
        proxy = "../../container-template/proxy"
        logo = "../../container-template"
    }
    args = {
        BASE_RELEASE_VERSION = "${RELEASE}"
        BASE_IMAGE = "rocm/pytorch:rocm6.0.2_ubuntu22.04_py3.10_pytorch_2.1.2"
    }
}
