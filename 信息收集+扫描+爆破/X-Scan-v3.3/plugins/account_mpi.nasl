#
# (C) Tenable Network Security, Inc.
#

account = "mpi";
password = "";


include("compat.inc");

if(description)
{
 script_id(18527);
 script_version ("$Revision: 1.15 $");

 script_cve_id("CVE-2005-1379");
 script_bugtraq_id(13431);
 script_xref(name:"OSVDB", value:"16305");
 
 script_name(english:"Unpassworded 'mpi' Account");

 script_set_attribute(attribute:"synopsis", value:
"The remote system can be accessed with a default account." );
 script_set_attribute(attribute:"description", value:
"The account 'mpi' on the remote host does not have a password set.  An
attacker may use it to gain further privileges on this system." );
 script_set_attribute(attribute:"solution", value:
"Set a strong password for this account or disable it.  This may
disable dependent applications so beware." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );

 script_end_attributes();

 script_summary(english:"Logs into the remote host");

 script_category(ACT_GATHER_INFO);

 script_family(english:"Default Unix Accounts");
 
 script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 
 
 script_dependencie("find_service1.nasl", "ssh_detect.nasl");
 script_require_ports("Services/telnet", 23, "Services/ssh", 22);
 exit(0);
}

#
# The script code starts here : 
#
include("default_account.inc");
include("global_settings.inc");

if ( ! thorough_tests && ! get_kb_item("Settings/test_all_accounts")) exit(0);

port = check_account(login:account, password:password);
if(port)security_hole(port);
