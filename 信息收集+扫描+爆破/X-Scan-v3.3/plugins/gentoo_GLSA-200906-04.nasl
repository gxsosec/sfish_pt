# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200906-04.xml
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
 script_id(39571);
 script_version("$Revision: 1.1 $");
 script_xref(name: "GLSA", value: "200906-04");
 script_cve_id("CVE-2008-5519");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200906-04 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200906-04
(Apache Tomcat JK Connector: Information disclosure)


    The Red Hat Security Response Team discovered that mod_jk does not
    properly handle (1) requests setting the "Content-Length" header while
    not providing data and (2) clients sending repeated requests very
    quickly.
  
Impact

    A remote attacker could send specially crafted requests or a large
    number of requests at a time, possibly resulting in the disclosure of a
    response intended for another client.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Apache Tomcat JK Connector users should upgrade to the latest
    version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=www-apache/mod_jk-1.2.27"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:H/Au:N/C:P/I:N/A:N');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-5519');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200906-04.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200906-04] Apache Tomcat JK Connector: Information disclosure');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Apache Tomcat JK Connector: Information disclosure');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "www-apache/mod_jk", unaffected: make_list("ge 1.2.27"), vulnerable: make_list("lt 1.2.27")
)) { security_note(0); exit(0); }
exit(0, "Host is not affected");
