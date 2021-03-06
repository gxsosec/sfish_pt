# This script was automatically generated from the dsa-482
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15319);
 script_version("$Revision: 1.9 $");
 script_xref(name: "DSA", value: "482");
 script_cve_id("CVE-2004-0003", "CVE-2004-0010", "CVE-2004-0109", "CVE-2004-0177", "CVE-2004-0178");
 script_bugtraq_id(10141, 10152, 9570, 9691, 9985);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-482 security update');
 script_set_attribute(attribute: 'description', value:
'Several serious problems have been discovered in the Linux kernel.
This update takes care of Linux 2.4.17 for the PowerPC/apus and S/390
architectures.  The Common Vulnerabilities and Exposures project
identifies the following problems that will be fixed with this update:
    A vulnerability has been discovered in the R128 DRI driver in the Linux
    kernel which could potentially lead an attacker to gain
    unauthorised privileges.  Alan Cox and Thomas Biege developed a
    correction for this.
    Arjan van de Ven discovered a stack-based buffer overflow in the
    ncp_lookup function for ncpfs in the Linux kernel, which could
    lead an attacker to gain unauthorised privileges.  Petr Vandrovec
    developed a correction for this.
    zen-parse discovered a buffer overflow vulnerability in the
    ISO9660 filesystem component of Linux kernel which could be abused
    by an attacker to gain unauthorised root access.  Sebastian
    Krahmer and Ernie Petrides developed a correction for this.
    Solar Designer discovered an information leak in the ext3 code of
    Linux.  In a worst case an attacker could read sensitive data such
    as cryptographic keys which would otherwise never hit disk media.
    Theodore Ts\'o developed a correction for this.
    Andreas Kies discovered a denial of service condition in the Sound
    Blaster driver in Linux.  He also developed a correction for this.
These problems are also fixed by upstream in Linux 2.4.26 and will be
fixed in Linux 2.6.6.
The following security matrix explains which kernel versions for which
architectures are already fixed.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2004/dsa-482');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your kernel packages immediately, either
with a Debian provided kernel or with a self compiled one.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA482] DSA-482-1 linux-kernel-2.4.17-apus+s390");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-482-1 linux-kernel-2.4.17-apus+s390");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'kernel-doc-2.4.17', release: '3.0', reference: '2.4.17-1woody3');
deb_check(prefix: 'kernel-headers-2.4.17', release: '3.0', reference: '2.4.17-2.woody.4');
deb_check(prefix: 'kernel-headers-2.4.17-apus', release: '3.0', reference: '2.4.17-5');
deb_check(prefix: 'kernel-image-2.4.17-apus', release: '3.0', reference: '2.4.17-5');
deb_check(prefix: 'kernel-image-2.4.17-s390', release: '3.0', reference: '2.4.17-2.woody.4');
deb_check(prefix: 'kernel-image-apus', release: '3.0', reference: '2.4.17-5');
deb_check(prefix: 'kernel-patch-2.4.17-apus', release: '3.0', reference: '2.4.17-5');
deb_check(prefix: 'kernel-patch-2.4.17-s390', release: '3.0', reference: '0.0.20020816-0.woody.3');
deb_check(prefix: 'kernel-source-2.4.17', release: '3.0', reference: '2.4.17-1woody3');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
