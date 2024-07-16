# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="7"

DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}
  sys-boot/rk-uboot-dev-binary
"
S=${WORKDIR}

src_prepare() {
  default
  cp ${FILESDIR}/*.bmp .
}

src_compile() {
  PACK_TOOL=${ROOT}/build/rkbin/tools/resource_tool
  ${PACK_TOOL} *.bmp
}

src_install() {
  insinto /boot
  doins resource.img
}