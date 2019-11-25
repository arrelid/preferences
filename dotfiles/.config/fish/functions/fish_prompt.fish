# Some colors to be used for git repo status
set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)

# Mostly copy/paste from https://medium.com/@joshuacrass/git-fish-prompt-faa389fff07c
set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_cleanstate ' 👍'
set __fish_git_prompt_char_conflictedstate ' ⚠️ '
set __fish_git_prompt_char_dirtystate ' 💩'
set __fish_git_prompt_char_invalidstate ' 🤮'
set __fish_git_prompt_char_stagedstate ' 🚥'
set __fish_git_prompt_char_stashstate ' 📦'
set __fish_git_prompt_char_stateseparator ' |'
set __fish_git_prompt_char_untrackedfiles ' 🔍'
set __fish_git_prompt_char_upstream_ahead ' ☝️'
set __fish_git_prompt_char_upstream_behind ' 👇'
set __fish_git_prompt_char_upstream_diverged ' 🚧'
set __fish_git_prompt_char_upstream_equal ' 💯'

function fish_prompt --description 'Write out the prompt'
  # Show user/host/pwd
  if test -z $WINDOW
    printf '%s%s@%s%s%s%s%s> ' (set_color yellow) (whoami) (set_color purple) (prompt_hostname) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  else
    printf '%s%s@%s%s%s(%s)%s%s%s> ' (set_color yellow) (whoami) (set_color purple) (prompt_hostname) (set_color white) (echo $WINDOW) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end

  # Show git repo status
  printf '%s ' (__fish_git_prompt)
  set_color normal
end
