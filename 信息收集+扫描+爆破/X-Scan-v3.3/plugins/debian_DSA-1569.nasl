# This script was automatically generated from the dsa-1569
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(32143);
 script_version("$Revision: 1.4 $");
 script_xref(name: "DSA", value: "1569");
 script_cve_id("CVE-2008-0783", "CVE-2008-0785");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1569 security update');
 script_set_attribute(attribute: 'description', value:
'It was discovered that Cacti, a systems and services monitoring frontend,
performed insufficient input sanitising, leading to cross site scripting
and SQL injection being possible.
For the stable distribution (etch), this problem has been fixed in
version 0.8.6i-3.4.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2008/dsa-1569');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your cacti package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1569] DSA-1569-2 cacti");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1569-2 cacti");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'cacti', release: '4.0', reference: '0.8.6i-3.4');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
