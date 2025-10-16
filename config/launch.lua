local platform = require('utils.platform')

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh', '-NoLogo' }
   options.launch_menu = {
      { label = 'Windows PowerShell', args = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe' } },
      { label = 'PowerShell Core',    args = { 'pwsh', '-NoLogo' } },
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      { label = 'Command Prompt',     args = { 'cmd' } },
      -- { label = 'Nushell',            args = { 'nu' } },
      {
         label = 'Anaconda Powershell Prompt',
         args = {
            'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-ExecutionPolicy', 'ByPass', '-NoExit',
            '-Command', "& 'D:\\Anaconda3\\shell\\condabin\\conda-hook.ps1' ; conda activate 'D:\\Anaconda3' "
         }
      },
      {
         label = 'Anaconda Command Prompt',
         args = {
            'c:\\Windows\\System32\\cmd.exe', "/K", 'D:\\Anaconda3\\Scripts\\activate.bat', 'D:\\Anaconda3'
         }
      },
      { label = 'UCRT64 / MSYS2', args = { 'D:/msys64/msys2_shell.cmd', '-defterm', '-here', '-no-start', '-ucrt64' } },
      {
         label = 'Git Bash(D:/Program Files/Git)', args = { 'D:/Program Files/Git/bin/bash.exe', '-i', '-l' },
      },
      {
         label = 'Git Bash(D:/Git)', args = { 'D:/Git/bin/bash.exe', '-i', '-l' },
      },
   }
elseif platform.is_mac then
   options.default_prog = { '/opt/homebrew/bin/fish', '-l' }
   options.launch_menu = {
      { label = 'Bash',    args = { 'bash', '-l' } },
      { label = 'Fish',    args = { '/opt/homebrew/bin/fish', '-l' } },
      { label = 'Nushell', args = { '/opt/homebrew/bin/nu', '-l' } },
      { label = 'Zsh',     args = { 'zsh', '-l' } },
   }
elseif platform.is_linux then
   options.default_prog = { 'bash', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
      { label = 'Zsh',  args = { 'zsh', '-l' } },
   }
end

return options
