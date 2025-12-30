# tree/core/hello/hello.ack

PKG_NAME="hello"
PKG_VERSION="2.12"

setup() {
    export CFLAGS="-O2"
    export LDFLAGS=""
}

src_fetch() {
    wget -O "hello-${PKG_VERSION}.tar.gz" \
         "https://ftp.gnu.org/gnu/hello/hello-${PKG_VERSION}.tar.gz"
}

src_unpack() {
    tar xf "hello-${PKG_VERSION}.tar.gz"
}

src_build() {
    cd "hello-${PKG_VERSION}"
    ./configure --prefix="$ACK_ROOT"
    make -j$(nproc)
}

src_install() {
    cd "hello-${PKG_VERSION}"
    make install
    # record installed files
    find "$ACK_ROOT" -type f | grep "/hello" > "$ACK_DB/hello.files"
}
