#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(33911);
 script_version("$Revision: 1.7 $");

 script_name(english: "Solaris 10 (sparc) : 138083-01");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 138083-01");
 script_set_attribute(attribute: "description", value:
'SunOS 5.10: snoop patch.
Date this patch was last updated by Sun : Aug/04/08');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-138083-01-1");
 script_set_attribute(attribute: "risk_factor", value: "Medium");
 script_end_attributes();

 script_summary(english: "Check for patch 138083-01");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"138083-01", obsoleted_by:"138104-01 141414-07 141444-09 ", package:"SUNWrcmdc", version:"11.10.0,REV=2005.01.21.15.53");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_warning(0);
	else  
	   security_warning(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
