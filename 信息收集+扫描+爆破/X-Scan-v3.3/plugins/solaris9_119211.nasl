#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(19842);
 script_version("$Revision: 1.18 $");

 script_name(english: "Solaris 5.9 (sparc) : 119211-21");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 119211-21");
 script_set_attribute(attribute: "description", value:
'NSS_NSPR_JSS 3.12.4: NSPR 4.8 / NSS 3.12.4 / JSS 4.3.
Date this patch was last updated by Sun : Oct/08/09');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-119211-21-1");
 script_set_attribute(attribute: "risk_factor", value: "High");
 script_end_attributes();

 script_summary(english: "Check for patch 119211-21");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWjss", version:"3.1.2.3,REV=2003.03.08.12.17");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWjssx", version:"3.1.2.3,REV=2003.03.08.12.22");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWpr", version:"4.1.2,REV=2002.09.03.00.17");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWprd", version:"4.1.6,REV=2003.09.08.10.19");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWprx", version:"4.1.2,REV=2002.09.03.00.17");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWtls", version:"3.3.2,REV=2002.09.18.12.49");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWtlsd", version:"3.3.6,REV=2003.09.08.10.30");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWtlsu", version:"3.3.7,REV=2003.12.01.12.23");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWtlsux", version:"3.3.10,REV=2004.03.25.01.10");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"119211-21", obsoleted_by:"", package:"SUNWtlsx", version:"3.3.2,REV=2002.09.18.12.49");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
