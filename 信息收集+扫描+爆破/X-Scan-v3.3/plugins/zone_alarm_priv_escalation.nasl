#
#  (C) Tenable Network Security
#

include("compat.inc");

if (description)
{
  script_id(21165);
  script_version("$Revision: 1.8 $");

  script_cve_id("CVE-2006-1221");
  script_bugtraq_id(17037);
  script_xref(name:"OSVDB", value:"23829");

  script_name(english:"ZoneAlarm VSMON.exe Local Privilege Escalation");
  script_summary(english:"Checks version of ZoneAlarm"); 
 
 script_set_attribute(attribute:"synopsis", value:
"The remote Windows application is prone to a local privilege
escalation issue." );
 script_set_attribute(attribute:"description", value:
"The remote host is running ZoneAlarm, a firewall for Windows.

The TrueVector service associated with the version of ZoneAlarm
installed on the remote host loads as part of its startup several
necessary DLLs without specifying their pathnames.  An attacker with
local access can exploit this flaw to execute arbitrary programs on
the affected host with LOCAL SYSTEM privileges." );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/427122/30/0/threaded" );
 script_set_attribute(attribute:"see_also", value:"http://download.zonelabs.com/bin/free/securityAlert/51.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to ZoneAlarm build 6.1.744.001 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:L/AC:H/Au:N/C:C/I:C/A:C" );
script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Firewalls");

  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");

  script_dependencies("smb_hotfixes.nasl");
  script_require_keys("SMB/Registry/Enumerated");
  script_require_ports(139, 445);

  exit(0);
}

include("global_settings.inc");
include("smb_func.inc");


# Connect to the appropriate share.
if (!get_kb_item("SMB/Registry/Enumerated")) exit(0);
name    =  kb_smb_name();
port    =  kb_smb_transport();
if (!get_port_state(port)) exit(0);
login   =  kb_smb_login();
pass    =  kb_smb_password();
domain  =  kb_smb_domain();

soc = open_sock_tcp(port);
if (!soc) exit(0);

session_init(socket:soc, hostname:name);
rc = NetUseAdd(login:login, password:pass, domain:domain, share:"IPC$");
if (rc != 1)
{
  NetUseDel();
  exit(0);
}


# Connect to remote registry.
hklm = RegConnectRegistry(hkey:HKEY_LOCAL_MACHINE);
if (isnull(hklm))
{
  NetUseDel();
  exit(0);
}


# Determine the version if it's installed.
key = "SOFTWARE\Zone Labs\ZoneAlarm";
key_h = RegOpenKey(handle:hklm, key:key, mode:MAXIMUM_ALLOWED);
if (!isnull(key_h))
{
  value = RegQueryValue(handle:key_h, item:"CurrentVersion");
  if (isnull(value)) ver = NULL;
  else ver = value[1];

  RegCloseKey (handle:key_h);
}
RegCloseKey(handle:hklm);
NetUseDel();


# If it is...
if (ver)
{
  # Save the version number for later scripts.
  set_kb_item(name:"zonealarm/version", value:ver);

  # There's a problem if the version is < 6.1.744.001.
  iver = split(ver, sep:'.', keep:FALSE);
  if (
    int(iver[0]) < 6 ||
    (
      int(iver[0]) == 6 && 
      (
        int(iver[1]) < 1 ||
        (
          int(iver[1]) == 1 && 
          (
            int(iver[2]) < 744 ||
            (int(iver[2]) == 744 && int(iver[3]) < 1)
          )
        )
      )
    )
  ) security_warning(get_kb_item("SMB/transport"));
}
