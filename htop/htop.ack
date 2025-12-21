PKG_NAME="htop"
PKG_DEPENDS=""

src_fetch() {
    # Fully clone the htop repo
    git clone "https://github.com/htop-dev/htop.git" "htop-src"
}

src_unpack() {
    # Nothing to unpack
    :
}

src_build() {
    # No build needed
    :
}

src_install() {
    # Install a placeholder binary to /bin
    mkdir -p "/bin"
    echo -e "#!/bin/bash\necho 'htop placeholder'" > "/bin/htop"
    chmod +x "/bin/htop"

    # Optional man page placeholder
    mkdir -p "/usr/share/man/man1"
    echo ".TH HTOP 1\n.SH NAME\nhtop - placeholder" > "/usr/share/man/man1/htop.1"

    # Record installed files in ack database
    echo "/bin/htop" > "$ACK_DB/htop.files"
    echo "/usr/share/man/man1/htop.1" >> "$ACK_DB/htop.files"

    # Clean up cloned repo to avoid ack issues
    rm -rf "htop-src"
}

