# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200510-09.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(19979);
 script_version("$Revision: 1.6 $");
 script_xref(name: "GLSA", value: "200510-09");
 script_cve_id("CVE-2005-3150");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200510-09 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200510-09
(Weex: Format string vulnerability)


    Ulf Harnhammar discovered a format string bug in Weex that can be
    triggered when it is first run (or when its cache files are rebuilt,
    using the -r option).
  
Impact

    An attacker could setup a malicious FTP server which, when
    accessed using Weex, could trigger the format string bug and end up
    executing arbitrary code with the rights of the user running Weex.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Weex users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=net-ftp/weex-2.6.1.5-r1"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2005-3150');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200510-09.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200510-09] Weex: Format string vulnerability');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Weex: Format string vulnerability');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "net-ftp/weex", unaffected: make_list("ge 2.6.1.5-r1"), vulnerable: make_list("lt 2.6.1.5-r1")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
