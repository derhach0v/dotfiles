# dotfiles

## Yabai Keybindings (Skhd)

#### Switch between Spaces

```
cmd - 0x21 : yabai -m space --focus prev 
```
```
cmd - 0x1E : yabai -m space --focus next
```

> To add ability to use this functionality:
> - Turn off SIP (System Integrity Protection) by booting into recovery mode and running `csrutil disable`
> - Generate sha256 hash and add ``sudo yabai --load-sa`` to run without password prompt 


### Change focus between displays
```
shift + alt - k : yabai -m display --focus north
```

```
shift + alt - j : yabai -m display --focus south
```

### Full Screen
```
shift + alt - m : yabai -m window --toggle zoom-fullscreen
```

### Balance open windows in current space
```
shift + alt - e : yabai -m space --balance
```

### Stop managing windows
```
shift + alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2
```

### Move between existing spaces (Move active window to space 1-9)
```
shift + cmd - 1 : yabai -m window --space 1; yabai -m space --focus 1
shift + cmd - 2 : yabai -m window --space 2; yabai -m space --focus 2
shift + cmd - 3 : yabai -m window --space 3; yabai -m space --focus 3
shift + cmd - 4 : yabai -m window --space 4; yabai -m space --focus 4
shift + cmd - 5 : yabai -m window --space 5; yabai -m space --focus 5
shift + cmd - 6 : yabai -m window --space 6; yabai -m space --focus 6
shift + cmd - 7 : yabai -m window --space 7; yabai -m space --focus 7
shift + cmd - 8 : yabai -m window --space 7; yabai -m space --focus 8
shift + cmd - 9 : yabai -m window --space 7; yabai -m space --focus 9
```

### Focus on space (Set active space to 1-9)

```
cmd-1 : yabai -m space --focus 1
cmd-2 : yabai -m space --focus 2
cmd-3 : yabai -m space --focus 3
cmd-4 : yabai -m space --focus 4
cmd-5 : yabai -m space --focus 5
cmd-6 : yabai -m space --focus 6
cmd-7 : yabai -m space --focus 7
cmd-8 : yabai -m space --focus 8
cmd-9 : yabai -m space --focus 9
```

### Start/Stop/Restart Yabai service

```
alt + cmd - q : yabai --stop-service
alt + cmd - o : yabai --start-service
alt + cmd - r : yabai --restart-service
```

### Resize windows

```
shift + ctrl - h : yabai -m window --resize left:-50:0; \
                  yabai -m window --resize right:-50:0
shift + ctrl - j : yabai -m window --resize bottom:0:50; \
                  yabai -m window --resize top:0:50
shift + ctrl - k : yabai -m window --resize top:0:-50; \
                  yabai -m window --resize bottom:0:-50
shift + ctrl - l : yabai -m window --resize right:50:0; \
                  yabai -m window --resize left:50:0
```

### Create/Destroy Space

```
shift + alt - n : yabai -m space --create && \
                   index="$(yabai -m query --spaces --display | jq 'map(select(."is-native-fullscreen" == false))[-1].index')" && \
                   yabai -m window --space "${index}" && \
                   yabai -m space --focus "${index}"


shift + alt - x : yabai -m space --destroy "$(yabai -m query --spaces --display | jq -r 'map(select(."has-focus" == true))[0].index')" 
```

## Karabiner Elements Keybindings

### Default profile

```
cmd + j : down_arrow
cmd + k : up_arrow
cmd + l : right_arrow
cmd + h : left_arrow
```

### Dota 2 profile

```
cmd => left_option
left_option => cmd
```


