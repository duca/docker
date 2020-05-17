function clean_deplist ()
{
    
}

VERSION = $(git rev-parse --short HEAD)


cont = $(cat <<-EOF
Name:           centos-developer
Version:        ${VERSION}
Release:        1%{?dist}
Summary:        Metapackage to pull all package require to develop for Centos
License:        OII
URL:            http://teste.com
Source0:        centos-developer-0.1-1.el7.tar.bz2
Requires:       ${DEPLIST}
BuildArch:      noarch
%description

%prep
%setup -c -q -T -D -a 0

%build

%install
rm -rf %{buildroot}
# _datadir is typically /usr/share/
install -d -m 0755 %{buildroot}/%{_datadir}/centos-developer/
install -d -m 0644 README.md > %{buildroot}/%{_datadir}/centos-developer/README.md

%files
%{_datadir}/centos-developer/README.md

%changelog
EOF
)


