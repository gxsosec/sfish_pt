#
#  (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description)
{
  script_id(34049);
  script_version("$Revision: 1.7 $");

  script_cve_id("CVE-2008-2431", "CVE-2008-2432", "CVE-2008-5231");
  script_bugtraq_id(30813);
  script_xref(name:"OSVDB", value:"50687");
  script_xref(name:"OSVDB", value:"50688");
  script_xref(name:"OSVDB", value:"51684");
  script_xref(name:"Secunia", value:"30667");

  script_name(english:"Novell iPrint Client ActiveX Control Multiple Vulnerabilities");
  script_summary(english:"Checks version of Novell iPrint ActiveX control");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote Windows host has an ActiveX control that is affected by
multiple vulnerabilities." );
 script_set_attribute(attribute:"description", value:
"Novell iPrint Client is installed on the remote host.

An ActiveX control included with Novell iPrint Client is affected
by multiple vulnerabilities.

- Vulnerabilities affecting GetDriverFile(), GetDriverSettings()
  GetPrinterURLList(), GetFileList(), GetServerVersion(), 
  UploadResource(), ExecuteRequest(), UploadResource(), and
  UploadResourceToRMS() methods in 'ienipp.ocx' could be exploited to 
  perform stack based buffer overflows and execute arbitrary code on
  the remote system.

- A vulnerability in IppGetDriverSettings() method in nipplib.dll
  could be exploited to perform a stack based buffer overflow.  

- A vulnerability in GetFileList() method may disclose sensitive 
  information." );
 script_set_attribute(attribute:"see_also", value:"http://secunia.com/secunia_research/2008-27/advisory/" );
 script_set_attribute(attribute:"see_also", value:"http://secunia.com/secunia_research/2008-30/advisory/" );
 script_set_attribute(attribute:"see_also", value:"http://download.novell.com/Download?buildid=_BILqzyqc2g~" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to version 5.06." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C" );

script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");

  script_dependencies("smb_hotfixes.nasl","os_fingerprint.nasl");
  script_require_keys("SMB/Registry/Enumerated");
  script_require_ports(139, 445);

  exit(0);
}


include("global_settings.inc");
include("smb_func.inc");
include("smb_activex_func.inc");

if (!get_kb_item("SMB/Registry/Enumerated")) exit(0);

os = get_kb_item("Host/OS");
if(isnull(os))exit(0);

if ("Vista" >< os) os = "Vista";
else os = "Windows";

# Locate the file used by the controls.
if (activex_init() != ACX_OK) exit(0);

clsid = "{36723F97-7AA0-11D4-8919-FF2D71D0D32C}";
file = activex_get_filename(clsid:clsid);
if (file)
{
  ver = activex_get_fileversion(clsid:clsid);
  v = split(ver,sep:".",keep:FALSE); 

  if (ver && activex_check_fileversion(clsid:clsid, fix:"5.0.6.0") == TRUE)
  {
    report = NULL;
    if (report_paranoia > 1)
      report = string(
        "\n",
        "Version ",string(v[0],".",v[1],v[2]), " of Novell iPrint Client for ",os,"\n",
        "\n",
        "  ", file, "\n",
        "\n",
        "Note, though, that Nessus did not check whether the 'kill' bit was\n",
        "set for the control's CLSID because of the Report Paranoia setting\n",
        "in effect when this scan was run.\n"
      );
    else if (activex_get_killbit(clsid:clsid) != TRUE)
      report = string(
        "\n",
        "Version ",string(v[0],".",v[1],v[2]), " of Novell iPrint Client for ",os,"\n",
        "\n",
        "  ", file, "\n",
        "\n",
        "Moreover, its 'kill' bit is not set so it is accessible via Internet\n",
        "Explorer.\n"
      );
    if (report)
    {
      if (report_verbosity) security_hole(port:kb_smb_transport(), extra:report);
      else security_hole(kb_smb_transport());
    }
  }
}
activex_end();
