Vim�UnDo� �{�f�϶L��+�H.t�4L�| ������C�x  i   			--sound  �                          Z�I    _�                    �   B    ����                                                                                                                                                                                                                                                                                                                                                             Z�~}     �  �  �  i      �		awful.key({}, "XF86AudioMute", function () awful.spawn("amixer -D pulse set Master +1 toggle") end, {description = "mute volume", group = "custom"}),5�_�                   �   D    ����                                                                                                                                                                                                                                                                                                                                                             Z�~     �  �  �  i      �		awful.key({}, "XF86AudioMute", function () awful.spawn("amixer -q pulse set Master +1 toggle") end, {description = "mute volume", group = "custom"}),5�_�                   �   I    ����                                                                                                                                                                                                                                                                                                                                                             Z�~�     �  �  �  i      �		awful.key({}, "XF86AudioRaiseVolume", function () awful.spawn("amixer -D pulse sset Master 5%+") end, {description = "decrease volume", group = "custom"}),5�_�                   �   K    ����                                                                                                                                                                                                                                                                                                                                                             Z�~�     �  �  �  i      �		awful.key({}, "XF86AudioRaiseVolume", function () awful.spawn("amixer -q pulse sset Master 5%+") end, {description = "decrease volume", group = "custom"}),5�_�                  �   I    ����                                                                                                                                                                                                                                                                                                                                                             Z�~�     �  �  �  i      �		awful.key({}, "XF86AudioLowerVolume", function () awful.spawn("amixer -D pulse sset Master 5%-") end, {description = "increase volume", group = "custom"}),5�_�      	             �   K    ����                                                                                                                                                                                                                                                                                                                                                             Z�~�     �  �  �  i      �		awful.key({}, "XF86AudioLowerVolume", function () awful.spawn("amixer -q pulse sset Master 5%-") end, {description = "increase volume", group = "custom"}),5�_�      
          	  �   O    ����                                                                                                                                                                                                                                                                                                                                                             Z�~�     �  �  �  i      �		awful.key({}, "XF86AudioMute", function () awful.spawn("amixer -q set Master +1 toggle") end, {description = "mute volume", group = "custom"}),5�_�   	              
  �   O    ����                                                                                                                                                                                                                                                                                                                                                             Z�~�     �  �  �  i      �		awful.key({}, "XF86AudioMute", function () awful.spawn("amixer -q set Master 1 toggle") end, {description = "mute volume", group = "custom"}),5�_�   
                �   O    ����                                                                                                                                                                                                                                                                                                                                                             Z�~�    �  �  �  i      �		awful.key({}, "XF86AudioMute", function () awful.spawn("amixer -q set Master  toggle") end, {description = "mute volume", group = "custom"}),5�_�                   �       ����                                                                                                                                                                                                                                                                                                                                                             Z�I      �  �  �  i      			--sound5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             Z�I    �  �  �  i      	--sound5�_�              	     �   D    ����                                                                                                                                                                                                                                                                                                                                                             Z�~�     �  �  �  i      �		awful.key({}, "XF86AudioMute", function () awful.spawn("amixer -q sllllllllllset Master +1 toggle") end, {description = "mute volume", group = "custom"}),5�_�                   �   I    ����                                                                                                                                                                                                                                                                                                                                                             Z�~�     �  �  �  i      �		awful.key({}, "XF86AudioLowerVolume", function () awful.spawn("amixer -pulse sset Master 5%-") end, {description = "increase volume", group = "custom"}),5��