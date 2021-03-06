# This script was automatically generated from the dsa-1238
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(23912);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "1238");
 script_cve_id("CVE-2006-6406", "CVE-2006-6481");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1238 security update');
 script_set_attribute(attribute: 'description', value:
'Several remote vulnerabilities have been discovered in the Clam anti-virus
toolkit. The Common Vulnerabilities and Exposures project identifies the
following problems:
CVE-2006-6406
    Hendrik Weimer discovered that invalid characters in base64 encoded
    data may lead to bypass of scanning mechanisms.
CVE-2006-6481
    Hendrik Weimer discovered that deeply nested multipart/mime MIME
    data may lead to denial of service.
For the stable distribution (sarge) these problems have been fixed in
version 0.84-2.sarge.13.
For the upcoming stable distribution (etch) these problems have been
fixed in version 0.88.7-1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2006/dsa-1238');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your clamav packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1238] DSA-1238-1 clamav");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1238-1 clamav");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'clamav', release: '3.1', reference: '0.84-2.sarge.13');
deb_check(prefix: 'clamav-base', release: '3.1', reference: '0.84-2.sarge.13');
deb_check(prefix: 'clamav-daemon', release: '3.1', reference: '0.84-2.sarge.13');
deb_check(prefix: 'clamav-docs', release: '3.1', reference: '0.84-2.sarge.13');
deb_check(prefix: 'clamav-freshclam', release: '3.1', reference: '0.84-2.sarge.13');
deb_check(prefix: 'clamav-milter', release: '3.1', reference: '0.84-2.sarge.13');
deb_check(prefix: 'clamav-testfiles', release: '3.1', reference: '0.84-2.sarge.13');
deb_check(prefix: 'libclamav-dev', release: '3.1', reference: '0.84-2.sarge.13');
deb_check(prefix: 'libclamav1', release: '3.1', reference: '0.84-2.sarge.13');
deb_check(prefix: 'clamav', release: '4.0', reference: '0.88.7-1');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
