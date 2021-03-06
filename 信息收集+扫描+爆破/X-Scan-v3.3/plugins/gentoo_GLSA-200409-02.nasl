# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200409-02.xml
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
 script_id(14649);
 script_version("$Revision: 1.7 $");
 script_xref(name: "GLSA", value: "200409-02");
 script_cve_id("CVE-2004-0457");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200409-02 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200409-02
(MySQL: Insecure temporary file creation in mysqlhotcopy)


    Jeroen van Wolffelaar discovered that the MySQL database hot copy utility
    (mysqlhotcopy.sh), when using the scp method, uses temporary files with
    predictable names. A malicious local user with write access to the /tmp
    directory could create a symbolic link pointing to a file, which may then
    be overwritten. In cases where mysqlhotcopy is run as root, a malicious
    user could create a symlink to a critical file such as /etc/passwd and
    cause it to be overwritten.
  
Impact

    A local attacker could use this vulnerability to destroy other users\' data
    or corrupt and destroy system files, possibly leading to a denial of
    service condition.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All MySQL users should upgrade to the latest version:
    # emerge sync
    # emerge -pv ">=dev-db/mysql-4.0.20-r1"
    # emerge ">=dev-db/mysql-4.0.20-r1"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2004-0457');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200409-02.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200409-02] MySQL: Insecure temporary file creation in mysqlhotcopy');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'MySQL: Insecure temporary file creation in mysqlhotcopy');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "dev-db/mysql", unaffected: make_list("ge 4.0.20-r1"), vulnerable: make_list("le 4.0.20")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
