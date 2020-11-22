# SecretManagement extension for BitWarden

> **NOTE: This is not a maintained project and it's specifically not maintained _by_ BitWarden.**
> **I work on it in my free time because I use BitWarden personally.**

> **Special Thanks to @TylerLeonhardt for publishing a baseline for this module extention **
> **Please check out his [`LastPass Extention`](https://github.com/TylerLeonhardt/SecretManagement.LastPass) **

## Prerequisites

Download and Install 


* [PowerShell](https://github.com/PowerShell/PowerShell)
* The [`bitwarden-cli`](https://bitwarden.com/help/article/cli/#download-and-install)
* The [SecretManagement](https://github.com/PowerShell/SecretManagement) PowerShell module

## Registration

Once you have it installed,
you need to register the module as an extension:

```pwsh
Register-SecretVault -ModuleName SecretManagement.BitWarden
```

Optionally, you can set it as the default vault by also providing the
`-DefaultVault`
parameter.


At this point,
you should be able to use
`Get-Secret`, `Set-Secret`
and all the rest of the
`SecretManagement`
commands!

#### outputType
(Accept: Default,Detailed,TOTP) 

By default, regular credentials are returned as string (for notes) and PSCredential (for credentials) 
Setting this parameter to **Detailed** will always return a hashtable. Effectively, this mean that the URL / Notes parameter of the regular credential will be exposed. 
TOTP code is for Two-factor authentication of compatible websites